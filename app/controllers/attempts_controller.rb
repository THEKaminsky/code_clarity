class AttemptsController < ApplicationController

  def index
  end

  def create
    @attempt = question.answer_for_user(current_user, answer_option, start_time)
    duration_in_seconds
    if has_next_question?
      redirect_to next_question
    else
      redirect_to complete_path
    end
  end

  def new
  end

  private
  def question
    @question ||= Question.find(params[:question_id])
  end

  def answer_option
    @answer_option ||= question.answer_options.where(id: params[:attempt][:answer_option_id]).first
  end

  def start_time
    @start_time ||= params[:attempt][:start_time]
  end

  def duration_in_seconds
     @attempt[:duration_in_seconds] = @attempt[:created_at] - @attempt[:start_time]
     @attempt.save
  end

  def has_next_question?
    question.next(current_user.id).present?
  end

  def next_question
    question.next(current_user.id)
  end
end
