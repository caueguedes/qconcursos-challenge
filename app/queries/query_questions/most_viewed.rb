module QueryQuestions
  class MostViewed
    def initialize
    end

    def by_week
      @time_range = 1.week.ago
      most_viewed
    end

    def by_month
      @time_range = 1.month.ago
      most_viewed
    end

    def by_year
      @time_range = 1.year.ago
      most_viewed
    end

    private
      def most_viewed
        Question.joins("LEFT JOIN (#{ summed_accesses }) summed_accesses on summed_accesses.question_id = questions.id" ).
            select('questions.* ,(coalesce(sum_times_accessed, 0) + daily_access) as total_accesses').
            order(total_accesses: :desc)
      end

      def summed_accesses
        QuestionAccess.
            select(:question_id, 'SUM(coalesce(times_accessed, 0))  sum_times_accessed').
            where(date: @time_range..Time.now).
            group(:question_id).to_sql
      end
  end
end
