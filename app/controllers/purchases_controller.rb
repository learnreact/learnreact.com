class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.includes([:user, :course]).all
  end
end
