class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.find(params[:id])

    # Amount in cents
    @amount = @order.grand_total
  
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
    @order.stripe_payment_id = charge.id
    @order.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
