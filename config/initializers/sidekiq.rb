# frozen_string_literal: true

require 'sidekiq/exception_handler'


#
# Configure Sidekiq/Redis
#
Sidekiq.configure_server do |config|
  config.redis = { host: Settings.redis_host, port: Settings.redis_port, db: REDIS_DB_MAP.index('sidekiq'), driver: :hiredis }
end

Sidekiq.configure_client do |config|
  config.redis = { host: Settings.redis_host, port: Settings.redis_port, db: REDIS_DB_MAP.index('sidekiq'), driver: :hiredis }
end


#
# Configure Sidekiq logger to redirect logs to Logster
# From https://github.com/discourse/discourse/blob/master/config/initializers/100-sidekiq.rb
#

if Rails.env.production?
  Sidekiq.logger = Syslogger.new('flap.worker', nil, Syslog::LOG_LOCAL7)
  Sidekiq.logger.level = Logger::WARN

  class SidekiqLogsterReporter < Sidekiq::ExceptionHandler::Logger

    # rubocop:disable Metrics/MethodLength
    def call(ex, context = {})
      # Pass context to Logster
      fake_env = {}
      context.each do |key, value|
        Logster.add_to_env(fake_env, key, value)
      end

      text = "Sidekiq Job exception: #{ex}\n"
      if ex.backtrace
        Logster.add_to_env(fake_env, :backtrace, ex.backtrace)
      end

      Logster.add_to_env(fake_env, :current_hostname, Settings.application_domain)

      Thread.current[Logster::Logger::LOGSTER_ENV] = fake_env
      Logster.logger.error(text)
    rescue => e
      Logster.logger.fatal("Failed to log exception #{ex} #{hash}\nReason: #{e.class} #{e}\n#{e.backtrace.join("\n")}")
    ensure
      Thread.current[Logster::Logger::LOGSTER_ENV] = nil
    end
  end
  # rubocop:enable Metrics/MethodLength

  Sidekiq.error_handlers << SidekiqLogsterReporter.new
end
