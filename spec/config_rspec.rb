RSpec.configure do |config|
  # Include standard helpers
  config.include Capybara::DSL
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include FeaturesHelper
  config.include Trailblazer::Test::Operation::Helper

  config.color = true
  config.fail_fast = false

  config.infer_spec_type_from_file_location!

  config.define_derived_metadata(file_path: Regexp.new('/spec/concepts/')) do |metadata|
    metadata[:type] = :concept
  end

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
    ActionMailer::Base.deliveries.clear
  end
end
