class OrdersController < ApplicationController

  def show
    @orders = Order.where(user: current_user)
  end

  def create
    subscription = Subscription.find(params[:subscription_id])
    if subscription.payment_option == "card"
      @order = Order.new(
        user: current_user,
        subscription: subscription,
        total_amount_cents: subscription.amount_cents,
        status: "pending",
        payment_method: "card"
      )
      @order.save
      redirect_to new_order_payment_path(@order)
    elsif subscription.payment_option == "cash"
      @order = Order.new(
        user: current_user,
        subscription: subscription,
        total_amount_cents: subscription.amount_cents,
        status: "pending",
        payment_method: "cash"
      )
      @order.save
      create_cash_plan(@order)
      redirect_to personal_dashboard_path
    end
  end

  def create_cash_plan(order)
    user_plan = UserPlan.new
    user_plan.user = current_user
    user_plan.order = order
    user_plan.left_usage = order.subscription.package_size
    user_plan.start_date = Date.today
    user_plan.end_date = Date.today + order.subscription.durability
    user_plan.save
  end
end
