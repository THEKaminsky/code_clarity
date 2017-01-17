class User < ActiveRecord::Base
  validates :fname, :lname, :email, presence: true
end
