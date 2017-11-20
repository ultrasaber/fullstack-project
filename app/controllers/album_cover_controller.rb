class AlbumCoverController < ApplicationController
  before_action :confirm_admin

  def show
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.album_cover = params[:song][:album_cover]
    @song.save

    redirect_to edit_album_cover_path(@song.id)
  end

  def delete
    @song = Song.find_by(id: params[:id])
    @song.album_cover = nil
    @song.save

    redirect_to edit_album_cover_path(@song.id)
  end
end
