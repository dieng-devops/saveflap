# frozen_string_literal: true

module Authentication
  class SessionsController < Devise::SessionsController

    layout 'login'

    def create
      super do |resource|
        # User is now logged in
        resource.update_columns(logged_in: true)
      end
    end

    def destroy
      # User is now logged out
      current_user.update_columns(logged_in: false)
      super
    end

  end
end
