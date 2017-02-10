class AttemptsController < ApplicationController
  def update
    @attempt = Attempt.find_by(user_id: current_user.id, question_id: question.id)
    @attempt.update(answer_option_id: answer_option.id)
    duration_in_seconds
    if has_next_question?
      redirect_to next_question
    else
      redirect_to complete_path
    end
  end

  private
  def question
    @question ||= Question.find(params[:question_id])
  end

  def answer_option
    @answer_option ||= question.answer_options.where(id: params[:attempt][:answer_option_id]).first
  end

  def duration_in_seconds
    @attempt[:duration_in_seconds] = @attempt[:updated_at] - @attempt[:start_time]
    @attempt.save
  end

  def has_next_question?
    question.next(current_user.id).present?
  end

  def next_question
    question.next(current_user.id)
  end
end
