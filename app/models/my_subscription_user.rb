class MySubscriptionUser < SimpleDelegator
  def subscription
    Subscription.new
  end
end