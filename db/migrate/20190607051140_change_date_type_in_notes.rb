class ChangeDateTypeInNotes < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :date, :datetime
  end
end
