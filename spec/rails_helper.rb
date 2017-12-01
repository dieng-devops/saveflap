require 'simplecov'

## Configure SimpleCov
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
])

SimpleCov.start 'rails' do
  add_group 'Datatables', 'app/datatables/'
  add_group 'Forms',      'app/forms/'
  add_group 'Policies',   'app/policies/'
  add_group 'Presenters', 'app/presenters/'
end

# Load env vars
ENV['RAILS_ENV'] ||= 'test'

# Load spec_helper (this configures base of RSpec)
require 'spec_helper'

# Load Rails
require File.expand_path('../../config/environment', __FILE__)

# Load RSpec for Rails
require 'rspec/rails'

# Load Capybara
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'

# Load Shoulda
require 'shoulda/matchers'
require 'shoulda/context'

# Load Pundit
require 'pundit/matchers'

# Configure Capybara
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 60, js_errors: false, window_size: [1600, 1200])
end

Capybara.current_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

## Configure RSpec
RSpec.configure do |config|
  # Include standard helpers
  config.include Capybara::DSL
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers

  config.color = true
  config.fail_fast = false

  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = false

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    # FactoryBot.lint
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
