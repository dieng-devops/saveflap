module Admin::Users::Contract
  class Update < ActionForm::Base
    self.main_model = :user
    include UserBase
  end
end
