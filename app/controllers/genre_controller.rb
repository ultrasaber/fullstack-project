class GenreController < ApplicationController
  def songs
    @genre = Genre.where(:id => params[:id]).first
    @songs = @genre.songs
  end
end
