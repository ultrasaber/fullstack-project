class AddAttachmentAlbumCoverToSongs < ActiveRecord::Migration[5.1]
  def change
    add_attachment :songs, :album_cover
  end
end
