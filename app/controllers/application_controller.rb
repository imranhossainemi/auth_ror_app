class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :check_user_status

  private

  def check_user_status
    return unless current_user && (current_user.rebuff? || !current_user.persisted?)

    sign_out current_user
    redirect_to new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname rebuff])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fullname rebuff])
  end
end
