class OrdersController < ApplicationController

  def show
    @orders = Order.where(user: current_user)
  end

  def create
    subscription = Subscription.find(params[:subscription_id])
    @order = Order.new(
      user: current_user,
      subscription: subscription,
      total_amount_cents: subscription.amount_cents,
      status: "pending"
    )
    @order.save
    redirect_to new_order_payment_path(@order)
  end
end
