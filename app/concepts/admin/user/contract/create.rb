module Admin::User::Contract
  class Create < ActionForm::Base

    self.main_model = :user

    # Real attributes
    attribute :first_name,            required: true
    attribute :last_name,             required: true
    attribute :language,              required: true
    attribute :time_zone,             required: true
    attribute :admin,                 required: false
    attribute :enabled,               required: false
    attribute :email,                 required: false
    attribute :password,              required: false
    attribute :password_confirmation, required: false

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
