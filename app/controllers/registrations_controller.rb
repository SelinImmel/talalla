class RegistrationsController < Devise::RegistrationsController
  # def create
  #   super
  #   raise
  # end

  protected

  def after_sign_up_path(resource)
    redirect_to root_path
  end
end
