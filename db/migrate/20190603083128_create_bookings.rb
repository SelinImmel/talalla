class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user_plan, foreign_key: true
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
