class AnswerOption < ActiveRecord::Base
  belongs_to :question
  has_many :attempts

  validates :content, presence: true
end
