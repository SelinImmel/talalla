class Studio < ApplicationRecord
  has_many :users
  has_many :events
  has_many :subscription

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
