# frozen_string_literal: true

module Admin
  class UserPolicy < AdminPolicy

    def permitted_attributes_for_create
      permitted_attributes_for_update + permitted_attributes_for_update_password
    end


    def permitted_attributes_for_update
      permitted_attributes_for_account + [:admin, :enabled]
    end


    def permitted_attributes_for_update_password
      [:password, :password_confirmation, :create_options, :send_by_mail]
    end


    def permitted_attributes_for_account
      [
        # Basic fields
        :first_name, :last_name, :email,
        # Settings fields
        :language, :time_zone,
      ]
    end

  end
end
