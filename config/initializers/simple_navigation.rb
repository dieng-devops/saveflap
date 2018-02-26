# frozen_string_literal: true

SimpleNavigation::Configuration.run do |navigation|
  navigation.auto_highlight       = true
  navigation.highlight_on_subpath = true
end

# Move menus configuration files in config/navigation directory
SimpleNavigation.config_file_path = Rails.root.join('config', 'navigation')
