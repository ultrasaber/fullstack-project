class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :price
      t.string :preview_link
      t.boolean :on_sale

      t.timestamps
    end
  end
end
