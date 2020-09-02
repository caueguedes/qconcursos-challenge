class QuestionsController < ApplicationController
  before_action :set_paginate_params, only: [:list, :index]

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_period

  def index
  end

  def list
  end

  def show
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def set_questions
      binding.pry
      @question = Question.filter(params.slice(:discipline))
    end

    def set_period
      @period
    end
end
