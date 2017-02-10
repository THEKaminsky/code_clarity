class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :attempts

  validates :email, :password, :password_confirmation, presence: true

  def has_answered_question(user_id, question_id)
    answered_questions = User.find(user_id).attempts.includes(:question).map{|a| a.question.id }

    answered_questions.include?(question_id)
  end
end
