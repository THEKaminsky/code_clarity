class UserAnswersController < ApplicationController

  def index
  end

  def create
    question.answer_for_user(current_user, answer_option)
    if has_next_question?
      redirect_to next_question
    else
      redirect_to complete_path
    end
  end

  def new
  end

  private def question
    @question ||= Question.find(params[:question_id])
  end

  private def answer_option
    @answer_option ||= question.answer_options.where(id: params[:user_answer][:answer_option_id]).first
  end

  private def has_next_question?
    question.next(current_user.id).present?
  end

  private def next_question
    question.next(current_user.id)
  end
end
