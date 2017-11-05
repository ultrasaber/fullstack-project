class UpdateForeignKeysOnOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :address_id, :integer
    remove_column :orders, :user_id
  end
end
