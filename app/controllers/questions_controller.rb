class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @start_time = Time.now.utc
    if current_user.has_answered_question(current_user.id, @question.id)
      redirect_to complete_path
    else
      new_attempt
    end
  end

  def new_attempt
    @attempt = Attempt.create(
        user_id: current_user.id,
        question_id: @question.id,
        start_time: @start_time)
  end
end
