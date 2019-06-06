class UserPlan < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
