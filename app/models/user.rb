class User < ApplicationRecord
  has_secure_password
  validates :username, length: { in: 3..32 }, presence: true
  validates :password, length: { minimum: 8 }
  validates_presence_of :email
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  before_save { username.downcase! }
  has_many :savings
  has_many :expenses
end
