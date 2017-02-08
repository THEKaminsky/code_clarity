class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer_option
  belongs_to :question
end
