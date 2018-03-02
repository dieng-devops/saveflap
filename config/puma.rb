# frozen_string_literal: true

# Define some custome variables
rails_path    = File.expand_path('../', __dir__)

workers_count = Integer(ENV.fetch('WEB_CONCURRENCY', 2))
threads_count = Integer(ENV.fetch('MAX_THREADS', 5))

current_env   = ENV.fetch('RAILS_ENV', 'development')

state_file    = File.join(rails_path, 'tmp', 'sockets', 'puma.state')
stdout_file   = File.join(rails_path, 'log', 'puma.stdout.log')
stderr_file   = File.join(rails_path, 'log', 'puma.stderr.log')

socket_file   = "unix://#{File.join(rails_path, 'tmp', 'sockets', 'puma.sock')}"
control_file  = "unix://#{File.join(rails_path, 'tmp', 'sockets', 'pumactl.sock')}"
tcp_port      = "tcp://#{ENV.fetch('LISTEN', '127.0.0.1')}:#{ENV.fetch('PORT', 5000)}"

# Configure Puma
workers workers_count
threads threads_count, threads_count

tag         'flap'
rackup      DefaultRackup
environment current_env

preload_app!

if current_env == 'development' || ENV['RAILS_SERVE_STATIC_FILES'] == 'true'
  bind tcp_port
else
  bind socket_file
end

if %w[production staging].include?(current_env)
  state_path           state_file
  stdout_redirect      stdout_file, stderr_file
  activate_control_app control_file

  before_fork do
    ActiveRecord::Base.connection_pool.disconnect!
  end

  on_worker_boot do
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.establish_connection
    end
  end
end
