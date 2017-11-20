class AddressesController < ApplicationController
  before_action :confirm_authenticated

  def new

  end

  def edit
    @address = Address.where(:id => params[:id]).first
    confirm_address_ownership(@address.user_id)
  end

  def create
    new_address             = current_user.addresses.build
    new_address.user_id     = current_user.id
    new_address.province_id = request.POST[:address][:province_id]
    new_address.first_name  = request.POST[:address][:first_name]
    new_address.last_name   = request.POST[:address][:last_name]
    new_address.address     = request.POST[:address][:address]
    new_address.city        = request.POST[:address][:city]
    new_address.save

    redirect_to user_settings_path
  end

  def update
    address = Address.where(:id => params[:id]).first
    confirm_address_ownership(address.user_id)

    address.province_id = request.POST[:address][:province_id]
    address.first_name  = request.POST[:address][:first_name]
    address.last_name   = request.POST[:address][:last_name]
    address.address     = request.POST[:address][:address]
    address.city        = request.POST[:address][:city]
    address.save

    redirect_to user_settings_path
  end

  def delete
    address = Address.where(:id => params[:id]).first
    confirm_address_ownership(address.user_id)

    address.destroy

    redirect_to user_settings_path
  end
end
