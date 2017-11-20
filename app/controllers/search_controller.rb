class SearchController < ApplicationController
  def search
    if params[:genre] != ''
      @songs = Genre.where(:id => params[:genre]).first.songs.where("title LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @songs = Song.where("title LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end
end
