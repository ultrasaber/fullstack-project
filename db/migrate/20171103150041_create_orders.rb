class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :pst_rate
      t.integer :gst_rate
      t.integer :hst_rate
      t.string :status

      t.timestamps
    end
  end
end
