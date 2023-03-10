class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    

    protected
    def after_sign_up_path_for(resource)
        profile_path
    end

    def after_sign_in_path_for(resource)
        profile_path
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    end
end
