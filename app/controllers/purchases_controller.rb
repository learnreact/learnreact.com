class PurchasesController < ApplicationController
  include SessionsHelper

  def index
    if user_signed_in?
      @purchases = Purchase.where(user: current_user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
