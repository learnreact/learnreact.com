class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 700

    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
    )

    stripe_charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
    )

    charge = Charge.new(charge_id: stripe_charge.id)

    charge.save

  rescue Stripe::CardError => e
    Bugsnag.notify(e)
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
