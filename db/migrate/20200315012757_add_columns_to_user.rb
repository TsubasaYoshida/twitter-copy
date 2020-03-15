class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :screen_name, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :url, :string
    add_column :users, :birthdate, :date
  end
end
