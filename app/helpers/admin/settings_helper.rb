module Admin
  module SettingsHelper

    SETTINGS_ICON_MAPPING = {
      rails_config:         'gears',
      db_config:            'database',
      redis_config:         'database',
      easy_app_config:      'gears',
      devise_config:        'shield',
      smtp_config:          'envelope',
      domains_config:       'random',
      monitoring_config:    'heartbeat',
      misc_config:          'gears',
    }.freeze

    def settings_icon_for(group_name)
      SETTINGS_ICON_MAPPING[group_name] || 'gears'
    end

  end
end
