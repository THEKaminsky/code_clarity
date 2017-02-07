class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    if current_user.has_answered_question(current_user.id, @question.id)
      redirect_to complete_path
    else
      new_attempt
    end
  end

  def new_attempt
    @attempt = Attempt.new(params[:user_id => current_user.id])
  end
end
