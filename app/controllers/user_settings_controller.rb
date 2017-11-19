class UserSettingsController < ApplicationController
  before_action :confirm_authenticated

  def index
    @addresses = current_user.addresses
  end
end
