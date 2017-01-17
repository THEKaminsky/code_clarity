class User < ActiveRecord::Base
  has_many :user_answers

  validates :fname, :lname, :email, presence: true
end
