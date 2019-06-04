class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.references :studio, foreign_key: true
      t.string :name
      t.string :location
      t.text :content
      t.integer :slots
      t.time :time
      t.string :occurrence

      t.timestamps
    end
  end
end
