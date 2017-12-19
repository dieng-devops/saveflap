# config valid only for current version of Capistrano
lock '3.10.1'

## Base
set :application, 'flap'
set :repo_url,    'ssh://git@gitlab.fb.int:2230/team-system/flap.git'
set :deploy_to,   '/home/flap'

## SSH
set :ssh_options, {
  keys:          [File.join(Dir.home, '.ssh', 'id_rsa')],
  forward_agent: true,
  auth_methods:  %w(publickey)
}

## RVM
set :rvm_ruby_version, '2.4.2'

## Bundler
set :bundle_flags, '--deployment'

## Rails
append :linked_dirs, 'log', 'tmp'

# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to :db role
set :migration_role, :app

# Cleanup assets after deploy
set :keep_assets, 1

## Foreman
set :foreman_roles,       :app
set :foreman_init_system, 'systemd'
set :foreman_services,    %w(web)
set :foreman_export_path, "#{deploy_to}/.config/systemd/user"
set :foreman_options,     {
  template: "#{deploy_to}/.foreman/templates/systemd",
  root:     current_path,
  timeout:  30,
}

## Config
set :deploy_config, {
  configure_services: %w[nginx syslog logrotate],
  syslog_services: %w[web]
}

## Nginx
set :nginx_vhosts, {
  back: { domain: 'flap.net', ssl: false }
}

## Deployment steps
namespace :deploy do
  before 'deploy:check',                'maintenance:start'
  before 'deploy:symlink:linked_files', 'config:install'
  after  'deploy:check:linked_files',   'foreman:install'
  after  'deploy:check:linked_files',   'maintenance:install'
  after  'deploy:published',            'bundler:clean'
  after  'deploy:finished',             'revision:copy'
  after  'deploy:finished',             'foreman:export'
  after  'deploy:finished',             'foreman:restart'
  after  'deploy:finished',             'maintenance:end'
end
