require 'settingslogic'

class Settings < Settingslogic
  source Rails.root.join('config', 'settings.yml')
  extend ActiveModel::Translation
  include ActiveModel::Conversion


  def grouped(nb = 4)
    grouped = []
    APPLICATION_CONFIG.keys.in_groups_of(nb).each do |keys|
      group = {}
      keys.each do |key|
        next if key.blank?
        group[key] = {}
        if key == :rails_config
          group[key]['RUBY_VERSION']  = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
          group[key]['RAILS_VERSION'] = Rails::VERSION::STRING
        end
        APPLICATION_CONFIG[key].each do |value|
          group[key][value] = ENV[value]
        end
      end
      grouped << group
    end
    grouped
  end

end
