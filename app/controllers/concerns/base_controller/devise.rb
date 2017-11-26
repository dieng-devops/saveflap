module BaseController
  module Devise
    extend ActiveSupport::Concern

    included do
      # This is a 'closed' application, be sure that visitors are logged in.
      before_action :require_login

      # Configure Devise strong parameters when needed
      before_action :configure_permitted_parameters, if: :devise_controller?
    end


    # This method is a more explicit shortcut for Devise #authenticate_user! method.
    # See https://github.com/plataformatec/devise for more infos.
    def require_login
      authenticate_user!
    end


    protected


      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:login, keys: [:email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:account_update, keys: [:current_password, :password, :password_confirmation])
        # devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
      end

  end
end
