# frozen_string_literal: true

module Admin::Users::Contract
  class Create < ActionForm::Base
    self.main_model = :user
    include UserBase
    include UserAdmin
    include UserPassword
  end
end
