class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameter, if: :devise_controller?

  private

  def configre_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end

end
