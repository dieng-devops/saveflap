class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include BaseController::Devise
  include BaseController::Menus

end
