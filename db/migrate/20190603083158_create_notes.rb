class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
