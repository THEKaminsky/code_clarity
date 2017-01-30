class UserAnswersController < ApplicationController

  def index
  end

  def create
    question.answer_for_user(current_user, answer_option)
    redirect_to next_question
  end

  def new
  end

  private def question
    @question ||= Question.find(params[:question_id])
  end

  private def answer_option
    @answer_option ||= question.answer_options.where(id: params[:user_answer][:answer_option_id]).first
  end

  private def next_question
    #the or will be the behavior for after the last.
    question.next(current_user.id) || Question.first
  end
end
