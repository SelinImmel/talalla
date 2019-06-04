class BookingsController < ApplicationController
  before_action :set_user

  def index
    @bookings.user = Booking.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
