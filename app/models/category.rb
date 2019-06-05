class Category < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  has_many :posts

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
