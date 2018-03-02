# frozen_string_literal: true

module MailingLists::Contract
  class Create < ActionForm::Base
    self.main_model = :mailing_list

    attribute :name, required: true
    attribute :description
    attribute :enabled

    validates :name, format: { with: ApplicationRecord::VALID_EMAIL_REGEX }

    association :emails do
      attributes :first_name, required: true
      attributes :last_name,  required: true
      attributes :email,      required: true

      validates :email, format: { with: ApplicationRecord::VALID_EMAIL_REGEX }
    end

  end
end
