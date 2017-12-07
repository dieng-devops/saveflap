class MailingListPolicy < ApplicationPolicy
  include PolicyHelper

  def permitted_attributes
    [:name, :description, :enabled]
  end

end
