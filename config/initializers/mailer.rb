# frozen_string_literal: true

# Mailer
Rails.application.config.action_mailer.default_options = { from: Settings.mail_from }

if Rails.env.production?
  Rails.application.config.action_mailer.delivery_method = :smtp
elsif Rails.env.development?
  Rails.application.config.action_mailer.delivery_method = :letter_opener_web
end

Rails.application.config.action_mailer.smtp_settings = {
  address:        Settings.smtp_host,
  port:           Settings.smtp_port,
  domain:         Settings.smtp_domain,
  user_name:      Settings.smtp_user,
  password:       Settings.smtp_pass,
  authentication: :plain,
  enable_starttls_auto: true
}
