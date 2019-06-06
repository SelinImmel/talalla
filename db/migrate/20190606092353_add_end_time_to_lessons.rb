class AddEndTimeToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :end_time, :datetime
    rename_column :lessons, :time, :start_time
    change_column :lessons, :start_time, :datetime
  end
end
