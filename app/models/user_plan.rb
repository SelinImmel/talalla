class UserPlan < ApplicationRecord
  belongs_to :order
  belongs_to :user

  has_one :subscription, through: :order
  has_many :bookings
end
