namespace :config do

  def syslog_services
    fetch(:deploy_config, {}).dig(:syslog_services) || []
  end

  def configure_services
    fetch(:deploy_config, {}).dig(:configure_services) || []
  end

  desc 'Install configuration files'
  task install: [:generate] do
    configure_services.each do |template|
      Rake::Task["config:#{template}:install"].invoke
    end
  end

  desc 'Generate configuration files'
  task :generate do
    # Invoke base tasks
    Rake::Task["config:app:generate"].invoke
    Rake::Task["config:sudo:generate"].invoke
    Rake::Task["config:bash:generate"].invoke

    # Invoke additional tasks
    configure_services.each do |template|
      Rake::Task["config:#{template}:generate"].invoke
    end
  end


  namespace :app do
    desc 'Install application config'
    task :generate do
      on roles(:all) do |host|
        # Create config dir
        execute 'mkdir', '-p', "#{shared_path}/config"
        execute 'mkdir', '-p', "#{shared_path}/tmp/sockets"

        # Upload config file
        upload! "deploy/application.#{fetch(:stage)}.conf", "#{shared_path}/config/application.conf"
        execute :chmod, 640, "#{shared_path}/config/application.conf"

        # Create symlink
        execute :ln, '-nfs', "#{shared_path}/config/application.conf", "#{release_path}/.env"
      end
    end
  end


  namespace :sudo do
    desc 'Install sudoers files'
    task :generate do
      on roles(:web) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/sudo"
        template 'sudo/web.conf', "#{shared_path}/config/sudo/web.conf"
      end

      on roles(:app) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/sudo"
        template 'sudo/app.conf', "#{shared_path}/config/sudo/app.conf"
      end

      on roles(:db) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/sudo"
        template 'sudo/db.conf', "#{shared_path}/config/sudo/db.conf"
      end
    end
  end


  namespace :bash do
    desc 'Install bash files'
    task :generate do
      on roles(:all) do |host|
        # Install bash profile with a fix for env vars and systemd
        template 'bash/profile', "#{deploy_to}/.profile", 0644
      end

      on roles(:app) do |host|
        # Configure RVM
        template 'bash/rvmrc', "#{deploy_to}/.rvmrc", 0644

        # Create bin dir
        execute 'mkdir', '-p', "#{deploy_to}/bin"

        # Install wrapper script around systemd services
        services = fetch(:foreman_services, [])
        template 'bash/systemd_wrapper.sh', "#{deploy_to}/bin/#{fetch(:application)}", 0755, locals: { services: services }

        %w[.bash_profile .zlogin .zshrc .mkshrc].each do |file|
          execute 'rm', '-f', file
        end
      end
    end
  end


  namespace :nginx do
    desc 'Generate nginx files'
    task :generate do
      on roles(:web) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/nginx"
        template 'nginx.conf', "#{shared_path}/config/nginx/nginx.conf", 0644
      end
    end

    desc 'Install nginx file'
    task install: [:generate] do
      on roles(:web) do |host|
        execute :sudo, :cp, "#{shared_path}/config/nginx/nginx.conf", "/etc/nginx/sites-enabled/#{fetch(:application)}.conf"
      end
    end
  end


  namespace :syslog do
    desc 'Generate syslog files'
    task :generate do
      on roles(:app) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/log"
        template 'syslog-ng.conf', "#{shared_path}/config/log/syslog-ng.conf", 0644, locals: { syslog_services: syslog_services }
      end
    end

    desc 'Install syslog file'
    task install: [:generate] do
      on roles(:app) do |host|
        execute :sudo, :cp, "#{shared_path}/config/log/syslog-ng.conf", "/etc/syslog-ng/conf.d/#{fetch(:application)}.conf"
      end
    end
  end


  namespace :logrotate do
    desc 'Generate logrotate file'
    task :generate do
      on roles(:web) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/log"
        template 'logrotate/nginx.conf', "#{shared_path}/config/log/logrotate.nginx.conf", 0644
      end

      on roles(:app) do |host|
        execute 'mkdir', '-p', "#{shared_path}/config/log"
        template 'logrotate/application.conf', "#{shared_path}/config/log/logrotate.application.conf", 0644, locals: { syslog_services: syslog_services }
      end
    end

    desc 'Install logrotate file'
    task install: [:generate] do
      on roles(:web) do |host|
        execute :sudo, :cp, "#{shared_path}/config/log/logrotate.nginx.conf", "/etc/logrotate.d/#{fetch(:application)}-nginx"
      end

      on roles(:app) do |host|
        execute :sudo, :cp, "#{shared_path}/config/log/logrotate.application.conf", "/etc/logrotate.d/#{fetch(:application)}-application"
      end
    end
  end

end
