require 'simplecov'

# Start SimpleCov
SimpleCov.start 'rails' do
  add_group 'Concepts',   'app/concepts/'
  add_group 'Datatables', 'app/datatables/'
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

# Load Shoulda
require 'shoulda/matchers'
require 'shoulda/context'

# Load Pundit
require 'pundit/matchers'

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

require_relative 'config_capybara'
require_relative 'config_rspec'
require_relative 'config_shoulda'

VALID_MAIL_ADDRESSES   = %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn).freeze
INVALID_MAIL_ADDRESSES = %w(user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo.bar.@gmail.com).freeze
