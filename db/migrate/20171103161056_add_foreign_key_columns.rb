class AddForeignKeyColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :genre_id, :integer
    add_column :users, :province_id, :integer
    add_column :orders, :user_id, :integer
    add_column :line_items, :order_id, :integer
  end
end
