class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @attempt = Attempt.new(params[:user_id => current_user.id])
  end
end
