class MailingListPolicy < ApplicationPolicy
  include PolicyHelper

  def permitted_attributes
    [:name, :description, :enabled, emails_attributes: [:first_name, :last_name, :email, :_destroy, :id]]
  end

end
