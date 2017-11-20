class CartController < ApplicationController
  before_action :confirm_authenticated

  def add_to_cart
    confirm_authenticated

    session[:shopping_cart] = [] unless session[:shopping_cart] != nil
    session[:shopping_cart] << params[:id] unless session[:shopping_cart].find_index(params[:id]) != nil

    redirect_to show_song_path(params[:id])
  end

  def remove_from_cart
    session[:shopping_cart].delete(params[:id])

    redirect_to show_cart_path
  end

  def index
    @songs = Song.find(session[:shopping_cart]) unless session[:shopping_cart] == nil
  end
end
