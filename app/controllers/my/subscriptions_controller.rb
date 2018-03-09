module My
  class SubscriptionsController < ApplicationController
    include SessionsHelper

    before_action :set_session_return_to

    def show
      user = MySubscriptionUser.new(current_user)
      @subscription = user.subscription
    end
  end
end