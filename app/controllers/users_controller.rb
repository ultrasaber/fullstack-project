class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def new
    @user = User.new
  end

  def with_orders
    confirm_admin

    user_ids = []

    Order.all.each do |order|
      user_ids << order.address.user.id
    end

    @users = User.find(user_ids)
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)

      flash[:notice] = 'Account successfully created.'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
