class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :join, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :location, :state, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, :uniqueness => { :case_sensitive => false }
end
