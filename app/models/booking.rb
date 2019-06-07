class Booking < ApplicationRecord
  belongs_to :user_plan
  belongs_to :user
  belongs_to :lesson

  #The user does not enter any information
  # validates :date, presence: true
end
