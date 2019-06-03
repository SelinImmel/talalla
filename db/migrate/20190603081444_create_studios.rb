class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :homepage

      t.timestamps
    end
  end
end
