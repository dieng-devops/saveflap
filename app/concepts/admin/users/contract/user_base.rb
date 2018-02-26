# frozen_string_literal: true

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
    end
  end
end
