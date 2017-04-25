module Courses
  class PurchasesController < ApplicationController
    include SessionsHelper

    before_action :authenticate_user!

    def new
      @course = Course.find(params[:course_id])
    end

    def create
      course = Course.find(params[:course_id])

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

      purchase = Purchase.new(
        :charge_token => stripe_charge.id,
        :course_id    => course.id,
        :user_id      => current_user.id
      )

      purchase.save

    rescue Stripe::CardError => e
        Bugsnag.notify(e)
        flash[:error] = e.message
        redirect_to new_course_purchases_path
    end
  end
end
