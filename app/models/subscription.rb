class Subscription < ApplicationRecord
  belongs_to :studio
  has_many :payments

  validates :name, presence: true
  validates :price, presence: true
  validates :durability, presence: true
end
