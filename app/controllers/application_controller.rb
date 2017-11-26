class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include BaseController::Devise
  include BaseController::Menus

  private

    def _run_options(options)
      options.merge( 'current_user' => current_user )
    end

end
