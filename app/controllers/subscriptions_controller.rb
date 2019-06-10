class SubscriptionsController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?

  before_action :set_studio

  def index
    @subscriptions = Subscription.where(studio: @studio)
  end

  def new
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    @subscription = Subscription.new(subscr_params)
    authorize @subscription
    @subscription.studio = @studio
    if @subscription.save
      redirect_to studio_subscriptions_path(@studio)
    else
      render :new
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    @subscription = Subscrition.find(params[:id])
    @subscription.update(subscr_params)
    if @subscription.update(subscr_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.destroy
    redirect_to studio_subscriptions_path
  end

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def subscr_params
    params.require(:subscription).permit(:name, :content, :amount, :package_size, :durability)
  end
end
