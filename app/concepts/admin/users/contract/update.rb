module Admin::Users::Contract
  class Update < ActionForm::Base
    self.main_model = :user
    include UserBase
    include UserAdmin
  end
end
