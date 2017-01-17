class Question < ActiveRecord::Base
  has_many :answer_options

  validates :content, presence: true
end
