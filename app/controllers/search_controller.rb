class SearchController < ApplicationController
  def search
    @songs = Song.where("title LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  end
end
