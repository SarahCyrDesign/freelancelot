class ApplicationController < ActionController::Base

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || root_path
    end


    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
    end
end
