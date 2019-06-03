class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
