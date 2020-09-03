module QueryQuestions
  class HotTopics < BasicQuery
    def initialize
      @relation = Question
    end

    def call
      @relation.joins("LEFT JOIN (#{ accesses }) as accesses on questions.id = accesses.question_id").
          select(:discipline, 'SUM(daily_access + coalesce(times_accessed, 0)) as total_accesses').
          group(:discipline).order(total_accesses: :desc)
    end

    def accesses
      QuestionAccess.where(date: 1.day.ago.at_beginning_of_day..1.day.ago.end_of_day).to_sql
    end
  end
end