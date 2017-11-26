class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  include BaseController::Devise
  include BaseController::Errors
  include BaseController::Menus

  private

    def _run_options(options)
      options.merge( 'current_user' => current_user )
    end

end
