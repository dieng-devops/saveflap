module BaseController
  module UserSession
    extend ActiveSupport::Concern

    private


      def session_scope
        @session_scope ||= self.class.name.gsub('Controller', '').underscore.downcase.to_sym
      end


      def get_data_in_session(key, scope = session_scope)
        if session[scope] && session[scope][key]
          session[scope][key]
        end
      end


      def set_data_in_session(key, value, scope = session_scope)
        session[scope] = {} unless session.key?(scope)
        session[scope][key] = value
      end

  end
end
