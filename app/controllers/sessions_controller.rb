class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def new
  end

  def create
    user = authenticate_session(session_params)

    if !user
      flash[:notice] = 'Failed to authenticate.'
      redirect_to new_session_path and return
    end

    if sign_in(user)
      flash[:notice] = 'Successfully logged in.'
      redirect_to root_path
    else
      flash[:notice] = 'Failed to sign in.'
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out

    flash[:notice] = 'Successfully signed out.'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
