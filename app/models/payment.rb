class Payment < ApplicationRecord
  belongs_to :subscription
  belongs_to :user
end
