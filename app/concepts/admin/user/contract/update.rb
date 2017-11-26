module Admin::User::Contract
  class Update < ActionForm::Base

    self.main_model = :user

    # Real attributes
    attributes :email, required: false

  end
end
