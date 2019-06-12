 class Order < ApplicationRecord
  belongs_to :subscription
  belongs_to :user
  has_one :user_plan, dependent: :destroy
end
