class AddEndTimeToLessons < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :time, :start_time
    add_column :lessons, :end_time, :time
  end
end
