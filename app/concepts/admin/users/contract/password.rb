# frozen_string_literal: true

module Admin::Users::Contract
  class Password < ActionForm::Base
    self.main_model = :user
    include UserPassword
  end
end
