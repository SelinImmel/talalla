class Subscription < ApplicationRecord
  belongs_to :studio
  has_many :orders, dependent: :destroy
  monetize :amount_cents

  validates :name, presence: true
  validates :amount_cents, presence: true
  validates :durability, presence: true
  validates :payment_option, presence: true, inclusion: { in: ['cash', 'card']}
end
