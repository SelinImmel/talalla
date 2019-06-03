class Booking < ApplicationRecord
  belongs_to :user_plan
  belongs_to :user
  belongs_to :lesson

  validates :date, presence: true
end
