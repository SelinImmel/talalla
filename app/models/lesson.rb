class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :studio

  validates :name, presence: true
  validates :location, presence: true
  validates :content, presence: true
  validates :slots, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :occurrence, presence: true

  def can_be_booked?
    self.bookings.size < self.slots
  end

end
