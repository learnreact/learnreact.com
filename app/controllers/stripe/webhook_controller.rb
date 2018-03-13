module Stripe
  class WebhookController < ApplicationController
    protect_from_forgery :except => :create

    def create
      event = Stripe::Event.retrieve(params[:id])
      # do something with charge success event
      head 201, content_type: "text/html"

    rescue [Stripe::APIConnectionError, Stripe::StripeError] => e
      Bugsnag.notify(e)
      head 400, content_type: "text/html"
    end
  end
end
