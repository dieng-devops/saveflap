module Admin::Users::Contract
  class Update < ActionForm::Base

    self.main_model = :user

    # Real attributes
    attribute :first_name, required: true
    attribute :last_name,  required: true
    attribute :email,      required: false
    attribute :language,   required: true
    attribute :time_zone,  required: true
    attribute :admin,      required: false
    attribute :enabled,    required: false
  end
end
