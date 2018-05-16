# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.1'

# Rails
gem 'rails', '5.2.0'

# Configuration
gem 'dotenv-rails'
gem 'figaro'
gem 'settingslogic'

# Server
gem 'puma'

# Database
gem 'mysql2'

# Redis
gem 'redis'
gem 'hiredis'

# Sessions and Cache
gem 'redis-rails'

# Authentication / Crypto
gem 'bcrypt'
gem 'devise'

# Javascript
gem 'mini_racer'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'uglifier'

# CSS
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

# Fonts
gem 'font-awesome-sass', '4.7.0'

# View rendering
gem 'haml-rails'

# Menus
gem 'simple-navigation'
gem 'simple_navigation_bootstrap'
gem 'rails_bootstrap_navbar'

# Manage page title easily
gem 'page_title_helper'

# Forms style
gem 'bootstrap_form'

# Locales
gem 'rails-i18n'

# Timezone
gem 'tzinfo'

# Speedup application loading
gem 'bootsnap'

# Trailblazer
gem 'trailblazer-rails'

# Form objects
gem 'actionform', git: 'https://github.com/jbox-web/actionform.git', require: 'action_form'

# Automatic flash messages
gem 'responders'

# Decorate models
gem 'draper'

# Authorizations
gem 'pundit'

# Live Rails Logs
gem 'logster'

# Async Jobs
gem 'sidekiq'

# Display services status page
gem 'health-monitor-rails'

# Use Syslog to manage our logs
gem 'syslogger'

# Be notified of exceptions in production
gem 'exception_notification'

# Foreman (so we can export systemd config files)
gem 'foreman'

# EMails
gem 'nokogiri'
gem 'premailer-rails'

# Datatables
gem 'ajax-datatables-rails'

# Prettyfy JSON
gem 'neatjson'

# Select2
gem 'select2-rails'

# Use pry instead of irb for Rails console
gem 'pry-rails'

# Pretty print objects Rails console
gem 'awesome_print'

# Ruby LDAP driver
gem 'net-ldap'

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'

  gem 'shoulda-matchers'
  gem 'shoulda-context'
  gem 'pundit-matchers'

  gem 'faker'
  gem 'factory_bot_rails'
  gem 'database_cleaner'

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'

  gem 'simplecov'

  gem 'trailblazer-test', git: 'https://github.com/trailblazer/trailblazer-test.git'
end

group :development do
  # Rails test server
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'

  # Deployment
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-foreman'
  gem 'capistrano-template'
  gem 'capistrano-scm-gitcopy'

  # Email preview
  gem 'letter_opener', '~> 1.4.0'
  gem 'letter_opener_web'

  # SQL Queries optimizer
  gem 'bullet'

  # Security analysis
  gem 'brakeman'

  # Code analyzer
  gem 'rubocop',    require: false
  gem 'rubycritic', require: false

  # Autorun tests
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'

  # Generate Entity-Relationship Diagrams
  gem 'rails-erd'

  # Manage gems license
  gem 'license_finder'

  # Create project documentation
  gem 'sdoc'
  gem 'toml'
  gem 'annotate'
end
