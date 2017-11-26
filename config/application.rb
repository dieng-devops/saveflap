require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

REDIS_DB_MAP = %w[
  health_check
  session
  sidekiq
  logster
  cache
  cable
]

module Flap
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Locales
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr]

    # Timezone
    config.time_zone = 'Paris'

    # Generators
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  :rspec
    end

    # Cache store
    config.cache_store = :redis_store, { host:       ENV['REDIS_HOST'],
                                         port:       ENV['REDIS_PORT'],
                                         db:         REDIS_DB_MAP.index('cache'),
                                         driver:     :hiredis,
                                         expires_in: 90.minutes }

    # Logster
    redis_server = Redis.new(
      host: ENV['REDIS_HOST'],
      port: ENV['REDIS_PORT'],
      db:   REDIS_DB_MAP.index('logster'),
      driver: :hiredis
    )
    Logster.store = Logster::RedisStore.new(redis_server)
  end
end
