module Admin::Users::Contract
  module UserBase
    extend ActiveSupport::Concern

    included do
      # Real attributes
      attribute :first_name, required: true
      attribute :last_name,  required: true
      attribute :email,      required: false
      attribute :language,   required: true
      attribute :time_zone,  required: true

      attribute :admin,      required: false
      attribute :enabled,    required: false

      # Validations
      validate  :email_format
    end


    def email_format
      return if email.nil?
      matches = email.match(ApplicationRecord::VALID_EMAIL_REGEX)
      return if matches.nil?
      matches = matches.named_captures
      errors.add(:email, :invalid) if matches.empty? || matches['mail'].end_with?('.')
    end
  end
end
