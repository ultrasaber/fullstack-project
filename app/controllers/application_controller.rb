class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception
  helper_method :currency_format, :percent_format

  def confirm_authenticated
    unless current_user != nil
      flash[:notice] = 'You must sign in to access this page.'
      redirect_to new_session_path
    end
  end

  def confirm_admin
    unless current_user != nil && current_user.is_admin
      flash[:notice] = 'Access denied.'
      redirect_to root_path
    end
  end

  def confirm_address_ownership(address_user_id)
    unless current_user.id == address_user_id
      flash[:notice] = 'Access denied.'
      redirect_to root_path
    end
  end

  def currency_format(amount_int)
    format('$%.2f', amount_int / 100.0)
  end

  def percent_format(amount_int)
    format('%.1f%', amount_int)
  end
end
