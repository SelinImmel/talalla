class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.text :content
      t.monetize :amount
      t.integer :package_size
      t.integer :durability
      t.string :subscription_sku
      t.references :studio, foreign_key: true

      t.timestamps
    end
  end
end
