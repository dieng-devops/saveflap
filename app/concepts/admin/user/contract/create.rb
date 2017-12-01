module Admin::User::Contract
  class Create < ActionForm::Base

    PASSWORD_OPTIONS = [
      ['generate', User.human_attribute_name('generate_password')],
      ['manual',   User.human_attribute_name('specify_password')],
    ].freeze

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
    attr_accessor :create_options
    attr_accessor :send_by_mail

    # Validations
    validates :create_options, presence: true, inclusion: { in: %w(generate manual) }

    def submit(params)
      super

      if create_options == 'generate'
        self.created_password      = Flap::Utils::Crypto.generate_secret(8)
        self.password              = created_password
        self.password_confirmation = created_password
      else
        self.created_password = params[:password]
      end
    end


    def send_email?
      send_by_mail == '1'
    end

  end
end
