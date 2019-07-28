class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
end
