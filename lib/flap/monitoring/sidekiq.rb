# frozen_string_literal: true

require 'health_monitor/providers/sidekiq'

module Flap
  module Monitoring
    class Sidekiq < HealthMonitor::Providers::Sidekiq

      private

        def check_latency!
          default_latency = ::HealthMonitor::Providers::Sidekiq::Configuration::DEFAULT_LATENCY_TIMEOUT
          latency = ::Sidekiq::Queue.new.latency

          return unless latency > default_latency

          raise "latency #{latency} is greater than #{default_latency}"
        end

        # rubocop:disable Metrics/MethodLength
        def check_workers!
          return true if Settings.sidekiq_running_workers.size == Settings.sidekiq_workers.size

          if Settings.sidekiq_running_workers.size == 0
            message = Settings.sidekiq_workers.map { |w| " * '#{w.name}' is down!" }.join("\n")
            raise "\n#{message}"
          end

          total   = Settings.sidekiq_workers.map { |w| w['queues'] }
          running = Settings.sidekiq_running_workers.map { |w| w['queues'] }
          down    = total - running

          message = []
          down.each do |d|
            worker = Settings.sidekiq_workers.find { |w| w['queues'] == d }
            message << " * '#{worker.name}' is down!"
          end
          message = message.join("\n")

          raise "\n#{message}"
        end
        # rubocop:enable Metrics/MethodLength

    end
  end
end
