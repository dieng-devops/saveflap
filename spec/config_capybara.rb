def register_driver(driver_name, args = [])
  Capybara.register_driver(driver_name) do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--window-size=1920,1200')
    args.each do |arg|
      options.add_argument(arg)
    end

    Capybara::Selenium::Driver.new(app,
      browser: :chrome,
      options: options
    )
  end

  Capybara::Screenshot.register_driver(driver_name) do |driver, path|
    driver.browser.save_screenshot(path)
  end
end

# Register our own custom drivers
register_driver(:chrome)
register_driver(:headless_chrome, ['headless', 'disable-gpu'])

# Configure Capybara JS driver
Capybara.current_driver    = :headless_chrome
Capybara.javascript_driver = :headless_chrome

# Configure Capybara server
Capybara.server_port = Integer(ENV.fetch('CAPYBARA_PORT', 3000))
Capybara.run_server  = true
