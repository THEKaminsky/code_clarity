class Question < ActiveRecord::Base
  has_many :answer_options
  has_many :user_answers, through: :answer_options

  validates :content, presence: true

  # scope :answered, (question_id) -> {}

  def answer_for_user(user, answer_option)

    UserAnswer.create(user_id: user.id, answer_option_id: answer_option.id)
  end

  def next(user_id)
    answered = User.find(user_id).user_answers.includes(:question).map{|a| a.question.id }

    Question.where.not(id: answered).first
  end

  end
end
