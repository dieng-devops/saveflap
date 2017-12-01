class DeviseMailer < Devise::Mailer

  def reset_password_instructions(record, token, opts = {})
    @host = get_host_for_record(record)
    super
  end


  def password_change(record, opts = {})
    @host     = get_host_for_record(record)
    @password = opts[:password]
    super
  end


  def welcome(record, opts = {})
    @host     = get_host_for_record(record)
    @password = opts[:password]
    devise_mail(record, :welcome)
  end


  private


    def subject_for(key)
      subject = super
      [t('application_name'), '::', subject].join(' ')
    end


    def get_host_for_record(record)
      Settings.application_domain
    end

end
