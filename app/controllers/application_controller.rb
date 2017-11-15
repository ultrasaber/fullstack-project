class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  def confirm_authenticated
    redirect_to new_session_path unless current_user != nil
  end
end
