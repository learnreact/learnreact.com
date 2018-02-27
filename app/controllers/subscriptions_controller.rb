class SubscriptionsController < ApplicationController
  layout "subscription"
  
  include SessionsHelper

  before_action :set_session_return_to

  def new
    # if user_signed_in?
    #   @purchases = Purchase.where(user: current_user)
    # else
    #   raise ActionController::RoutingError.new('Not Found')
    # end
  end
  def create
    authenticate_user!

    # store retrievable customer on user model
    customer =
      if current_user.customer_token.present?
        Stripe::Customer.retrieve(current_user.customer_token)
      else
        Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken],
        )
      end

    stripe_subscription = Stripe::Subscription.create(
      :customer    => customer.id,
      :items => [{
        :plan => "yearly-36"
      }]
    )

    @subscription = Subscription.new(
      :subscription_token => stripe_subscription.id,
      :user_id => current_user.id,
    )

    ActiveRecord::Base.transaction do
      current_user.update(customer_token: customer.id)
      @subscription.save
    end

    # redirect_to subscriptions_path, :notice => 'Thanks for your purchase!'
    flash[:notice] = "Thanks for your purchase"

  rescue Stripe::CardError => e
    Bugsnag.notify(e)
    flash[:error] = e.message
    redirect_to new_course_purchase_path(params[:course_id])
  end
end
