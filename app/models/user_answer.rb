class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_option
  has_one :question, through: :answer_option
end
