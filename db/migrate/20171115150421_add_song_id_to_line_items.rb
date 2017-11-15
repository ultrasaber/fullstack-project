class AddSongIdToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :song_id, :integer
  end
end
