class Question < ActiveRecord::Base
  has_many :answer_options
  has_many :attempts

  validates :content, presence: true

  # scope :answered, (question_id) -> {}

  def answer_for_user(user, answer_option, start_time)
    Attempt.create(user_id: user.id, answer_option_id: answer_option.id, start_time: start_time)
  end

  def next(user_id)
    Question.where.not(id: answered_questions(user_id)).first
  end

  def answered_questions(user_id)
    User.find(user_id).attempts.includes(:question).map{|a| a.question.id }
  end
end
