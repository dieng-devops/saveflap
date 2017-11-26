module Admin::User::Contract
  class Create < ActionForm::Base

    self.main_model = :user

    # Real attributes
    attributes :email,                 required: false
    attributes :password,              required: false
    attributes :password_confirmation, required: false

    # Virtual attributes (options)
    attr_accessor :created_password


    def submit(params)
      super

      self.created_password      = Flap::Utils::Crypto.generate_secret(8)
      self.password              = created_password
      self.password_confirmation = created_password
    end

  end
end
