module Admin::Users::Contract
  class Create < ActionForm::Base
    self.main_model = :user
    include UserBase
    include UserPassword
  end
end
