# frozen_string_literal: true

module Admin
  class AdminPolicy < ApplicationPolicy
    include PolicyHelper

    private

      def allowed_roles
        admin_only
      end

  end
end
