class QuestionsController < ApplicationController
  include Pagination

  before_action :set_paginate_params, only: :index
  before_action :set_hot_topics,       only: :index
  before_action :set_question,        only: :show

  def index
    return set_questions unless policy.caching_allowed?
    @questions = Rails.cache.fetch("#query_cache_#{questions_params.values.join('_')}",
                                   expires_in: QueryCachingPolicy::CACHING_TIME ) do
      set_questions.map { |record| OpenStruct.new( record.as_json ) }
    end
  end

  def show
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def set_questions
      @questions = Question.filter(params.slice(:discipline))
      questions_by_period if %w(week month year).include? params[:period]
      @questions = paginate(@questions)
    end

    def questions_by_period
      @questions = QueryQuestions::MostViewed.new(@questions).public_send("by_#{params[:period]}")
    end

    def set_hot_topics
      @hot_topics = Rails.cache.fetch('#hot_topics', expires_in: QueryCachingPolicy::CACHING_TIME ) do
        QueryQuestions::HotTopics.call.collect(&:discipline)
      end
    end

    def policy
      QueryCachingPolicy.new(params: questions_params)
    end

  def questions_params
    params.slice(:discipline, :period, :page).with_defaults(page: 1)
  end
end