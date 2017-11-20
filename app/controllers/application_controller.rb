class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception
  helper_method :currency_format, :percent_format

  def confirm_authenticated
    redirect_to new_session_path unless current_user != nil
  end

  def confirm_admin
    head 403 unless current_user != nil && current_user.is_admin
  end

  def confirm_address_ownership(address_user_id)
    head 403 unless current_user.id == address_user_id
  end

  def currency_format(amount_int)
    format('$%.2f', amount_int / 100.0)
  end

  def percent_format(amount_int)
    format('%.1f%', amount_int)
  end
end
