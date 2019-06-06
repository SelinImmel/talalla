class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :studio

  validates :title, presence: true
  validates :date, presence: true
end
