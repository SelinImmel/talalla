class Studio < ApplicationRecord
  has_many :users
  has_many :events
  has_many :subscriptions
  has_many :lessons, through: :users
  has_many :categories

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
