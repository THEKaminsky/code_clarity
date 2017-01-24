class Question < ActiveRecord::Base
  has_many :answer_options
  has_many :user_answers, through: :answer_options

  validates :content, presence: true

  def answer_for_user (user, answer_option)
    UserAnswer.create(user_id: user.id, answer_option_id: answer_option.id)
  end

  def next
    Question.where("id > ?", self.id).order("id ASC").first
  end
end
