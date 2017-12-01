module BaseController
  module UserSettings
    extend ActiveSupport::Concern

    included do
      before_action :setup_locale

      # Set TimeZone for current user
      # Must be in a around_action : Time.zone is NOT request local
      # http://railscasts.com/episodes/106-time-zones-revised?view=comments#comment_162005
      around_action :set_time_zone
    end


    def setup_locale
      I18n.locale = current_user.language || I18n.default_locale
    end


    def set_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end


    def reload_user_locales
      current_user.reload
      setup_locale
    end

  end
end
