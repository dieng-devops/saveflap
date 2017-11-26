module BaseController
  module Menus
    extend ActiveSupport::Concern

    included do
      helper_method :sidebar_menu

      class_attribute :sidebar_menu

      class << self
        def set_sidebar_menu(menu)
          self.sidebar_menu = menu
        end
      end

      set_sidebar_menu :user
    end
  end
end
