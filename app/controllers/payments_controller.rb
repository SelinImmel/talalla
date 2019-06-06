class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id, # You should store this customer id and re-use it.
      amount:       @order.total_amount_cents,
      description:  "Payment for #{@order.subscription.name} for order #{@order.id}",
      currency:     @order.total_amount_currency
    )

    @order.update(payment: charge.to_json, status: 'paid')
    create_user_plan(@order)
    redirect_to personal_dashboard_path

    # this only happens if payment fails
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(status: "pending").find(params[:order_id])
  end

  def create_user_plan(order)
    # UserPlan.create...
    @user_plan = UserPlan.new(
      user: current_user,
      order: order,
      left_usage: order.subscription.package_size,
      start_date: Date.today,
      end_date: Date.today + order.subscription.usability
    )
    @user_plan.save
  end
end
