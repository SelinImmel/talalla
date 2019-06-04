class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :subscription, foreign_key: true
      t.references :user, foreign_key: true
      t.monetize :total_amount
      t.date :date
      t.string :status
      t.jsonb :payment
      t.string :payment_method

      t.timestamps
    end
  end
end
