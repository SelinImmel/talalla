class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :biography, :text
    add_column :users, :is_teacher, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
    add_reference :users, :studio, foreign_key: true
  end
end
