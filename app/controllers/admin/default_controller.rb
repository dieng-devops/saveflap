module Admin
  class DefaultController < ApplicationController
    before_action :require_admin
    set_sidebar_menu :admin
  end
end
