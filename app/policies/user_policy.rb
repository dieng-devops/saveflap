class UserPolicy < ApplicationPolicy
  include PolicyHelper

  def permitted_attributes
    [
      # Basic fields
      :first_name, :last_name, :email,
      # Settings fields
      :language, :time_zone,
    ]
  end

end
