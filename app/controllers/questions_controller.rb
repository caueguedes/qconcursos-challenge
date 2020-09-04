class QuestionsController < ApplicationController
  include Pagination

  before_action :set_paginate_params, only: :index
  before_action :set_hot_topics,       only: :index
  before_action :set_questions,       only: :index
  before_action :set_question,        only: :show

  def index
  end

  def show
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def set_questions
      @questions = Question.filter(params.slice(:discipline))
      set_period if %w(week month year).include? params[:period]
      @questions = paginate(@questions)
    end

    def set_period
      @questions = QueryQuestions::MostViewed.new(@questions).public_send("by_#{params[:period]}")
    end

    def set_hot_topics
      @hot_topics = QueryQuestions::HotTopics.call
    end
end
