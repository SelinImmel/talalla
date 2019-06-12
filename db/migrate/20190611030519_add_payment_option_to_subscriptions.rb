class AddPaymentOptionToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :payment_option, :string
  end
end
