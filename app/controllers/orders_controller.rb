class OrdersController < ApplicationController
  def show
    @orders = Order.where(user: current_user)
  end

  def create
    subscription = Subscription.find(:subscription_id)
    @order = Order.new(
      user: current_user,
      subscription: subscription,
      total_amount: subscription.price,
      status: "pending"
    )
    @order.save
  end
end
