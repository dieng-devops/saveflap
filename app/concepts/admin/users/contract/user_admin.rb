# frozen_string_literal: true

module Admin::Users::Contract
  module UserAdmin
    extend ActiveSupport::Concern
    included do
      attribute :admin,   required: false
      attribute :enabled, required: false
    end
  end
end
