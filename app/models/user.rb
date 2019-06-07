class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :studio
  has_many :orders
  has_many :user_plans
  has_many :bookings
  has_many :lessons
  has_many :comments
  has_many :posts
  has_many :categories
  has_many :notes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true


  def can_make_bookings?
    # assuming there's only one user plan per user
    the_user_plan = self.user_plans.first
    the_user_plan.bookings.size < the_user_plan.left_usage
  end
end
