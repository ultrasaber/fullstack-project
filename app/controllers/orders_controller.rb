class OrdersController < ApplicationController
  before_action :confirm_admin

  def set_paid
    order = Order.find(params[:id])

    order.status = 'PAID'
    order.save

    redirect_to order_manager_path
  end

  def set_shipped
    order = Order.find(params[:id])

    order.status = 'SHIPPED'
    order.save

    redirect_to order_manager_path
  end
end
