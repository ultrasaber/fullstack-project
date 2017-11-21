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

  def checkout
    address = Address.where(:id => params[:address]).first
    confirm_address_ownership(address.user.id)

    @new_order = address.orders.build

    @new_order.pst_rate = address.province.pst_rate
    @new_order.gst_rate = address.province.gst_rate
    @new_order.hst_rate = address.province.hst_rate
    @new_order.status = 'NEW'

    songs = Song.find(session[:shopping_cart]) unless session[:shopping_cart] == nil
    redirect_to show_cart_path if songs.count == 0

    songs.each do |song|
      new_line_item = @new_order.line_items.build

      new_line_item.price = song.price
      new_line_item.song_id = song.id

      new_line_item.save
    end

    @new_order.save
    session[:shopping_cart] = nil
  end

  def invoice
    @address = Address.where(:id => params[:address]).first
    confirm_address_ownership(@address.user.id)

    @songs = Song.find(session[:shopping_cart]) unless session[:shopping_cart] == nil
    redirect_to show_cart_path if @songs.count == 0

    @subtotal = 0

    @songs.each do |song|
      @subtotal += song.price
    end

    @gst = (@subtotal * (@address.province.gst_rate / 100.0)).round.to_i
    @pst = (@subtotal * (@address.province.pst_rate / 100.0)).round.to_i
    @hst = (@subtotal * (@address.province.hst_rate / 100.0)).round.to_i
    @grand_total = @subtotal + @gst + @pst + @hst
  end
end
