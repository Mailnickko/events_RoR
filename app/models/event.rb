class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :user
end
