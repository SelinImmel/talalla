class UserPlan < ApplicationRecord
  belongs_to :payment
  belongs_to :user
  has_many :bookings
end
