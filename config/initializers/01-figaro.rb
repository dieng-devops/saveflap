# frozen_string_literal: true

# Check that all environment variables are present before running the application.

APPLICATION_CONFIG = {
  rails_config: %w[
    SECRET_KEY_BASE
  ],

  db_config: %w[
    DB_ADAPTER
    DB_HOST
    DB_PORT
    DB_NAME
    DB_USER
    DB_PASS
  ],

  redis_config: %w[
    REDIS_HOST
    REDIS_PORT
  ],

  devise_config: %w[
    SESSION_TIMEOUT
  ],

  app_config: %w[
    APPLICATION_DOMAIN
  ],

  monitoring_config: %w[
    MAIL_ON_APPLICATION_ERROR
    STATUS_PAGE_USER
    STATUS_PAGE_PASS
  ],

  smtp_config: %w[
    SMTP_HOST
    SMTP_PORT
    SMTP_DOMAIN
    SMTP_USER
    SMTP_PASS
    MAIL_FROM
  ],

  ldap_config: %w[
    LDAP_HOST
    LDAP_PORT
    LDAP_USER
    LDAP_PASS
  ],
}.freeze

begin
  Figaro.require_keys(*APPLICATION_CONFIG.values.flatten)
rescue Figaro::MissingKeys => e
  puts "\n#{e.message}"
  exit 1
end
