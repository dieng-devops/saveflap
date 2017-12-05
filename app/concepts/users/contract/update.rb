module Users::Contract
  class Update < ActionForm::Base
    self.main_model = :user
    include Admin::Users::Contract::UserBase
  end
end
