module Courses
  class PurchasesController < ApplicationController
    include SessionsHelper

    before_action :set_session_return_to

    def new
      @course = Course.find_by(slug: params[:course_id])
    end

    def create
      authenticate_user!

      course = Course.find_by(slug: params[:course_id])

      @amount = Course.new.price

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

      purchase = Purchase.new(
        :charge_token => stripe_charge.id,
        :course_id    => course.id,
        :user_id      => current_user.id
      )

      purchase.save

      redirect_to purchases_path, :notice => 'Thanks for your purchase!'

    rescue Stripe::CardError => e
      Bugsnag.notify(e)
      flash[:error] = e.message
      redirect_to new_course_purchase_path(params[:course_id])
    end
  end
end
