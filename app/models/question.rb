class Question < ActiveRecord::Base
  has_many :answer_options
  has_many :attempts

  validates :content, presence: true

  def next(user_id)
    Question.where.not(id: answered_questions(user_id)).first
  end

  def answered_questions(user_id)
    User.find(user_id).attempts.includes(:question).map{|a| a.question.id }
  end
end
