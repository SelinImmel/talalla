class CreateUserPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :user_plans do |t|
      t.references :order, foreign_key: true
      t.integer :left_usage
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
