class Event < ApplicationRecord
  belongs_to :studio

  validates :title, presence: true
  validates :date, presence: true
end
