# frozen_string_literal: true

HealthMonitor.configure do |config|
  config.basic_auth_credentials = {
    username: Settings.status_page_user,
    password: Settings.status_page_pass
  }
  config.cache
  config.redis.configure do |redis_config|
    redis_config.url = "redis://#{Settings.redis_host}:#{Settings.redis_port}/#{REDIS_DB_MAP.index('health_check')}"
  end
  # config.add_custom_provider(Flap::Monitoring::Sidekiq)
end
