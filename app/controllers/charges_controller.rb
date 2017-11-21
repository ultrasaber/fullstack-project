class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.find(params[:id])

    # Amount in cents
    @amount = @order.grand_total # TODO: change this to order grand total
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'VIVACE CUSTOMER',
      :currency    => 'cad'
    )
    
    @order.status = 'PAID'
    @order.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
