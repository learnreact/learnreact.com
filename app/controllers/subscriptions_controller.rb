class SubscriptionsController < ApplicationController
  include SessionsHelper

  def new
    # if user_signed_in?
    #   @purchases = Purchase.where(user: current_user)
    # else
    #   raise ActionController::RoutingError.new('Not Found')
    # end
  end
  def create
    authenticate_user!

    # course = Course.find_by(slug: params[:course_id])

    # @amount = Course.new.price
    @amount = 2018

    # store retrievable customer on user model
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
      :plan => "yearly-12"
    )

    stripe_charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Annual Subscription — 2018 Promo',
      :currency    => 'usd'
    )

    # purchase = Purchase.new(
    #   :charge_token => stripe_charge.id,
    #   :course_id    => course.id,
    #   :user_id      => current_user.id
    # )

    # purchase.save

    redirect_to purchases_path, :notice => 'Thanks for your purchase!'

  rescue Stripe::CardError => e
    Bugsnag.notify(e)
    flash[:error] = e.message
    redirect_to new_course_purchase_path(params[:course_id])
  end
end
