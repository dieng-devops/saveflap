# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  include BaseController::Devise
  include BaseController::Errors
  include BaseController::Menus
  include BaseController::UserSettings
  include BaseController::UserSession

  rescue_from Pundit::NotAuthorizedError,   with: :render_403
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

    def _run_options(options)
      options.merge('current_user' => current_user)
    end

end
