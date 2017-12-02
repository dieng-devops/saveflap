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
    attr_accessor :create_options
    attr_accessor :send_by_mail

    # Validations
    validates :create_options, presence: true, inclusion: { in: %w(generate manual) }
    validate  :email_format

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
      send_by_mail.in? [true, '1']
    end


    def email_format
      return if email.nil?
      matches = email.match(ApplicationRecord::VALID_EMAIL_REGEX)
      return if matches.nil?
      matches = matches.named_captures
      errors.add(:email, :invalid) if matches.empty? || matches['mail'].end_with?('.')
    end

  end
end
