class SubscriptionsController < ApplicationController
  before_action :set_studio

  def index
    @subscriptions = Subscription.where(studio: @studio)
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create(subscr_params)
    if @subscription.save
      redirect_to studio_subscriptions_path(@studio)
    else
      render :new
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end

  def subscr_params
    params.require(:subscription).permit(:name, :content, :amount, :package_size, :durability)
  end
end
