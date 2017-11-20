class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def by_on_sale
    @songs = Song.where(:on_sale => true)
  end

  def by_new
    @songs = Song.order(:created_at).reverse.take(5)
  end
end
