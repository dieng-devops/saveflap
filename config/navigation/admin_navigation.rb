# frozen_string_literal: true

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |menu|
    menu.dom_id = 'side-menu'
    menu.dom_class = 'nav'

    if policy(:admin_zone).show?
      menu.item :homepage,       { icon: icon_for_entry('fa-home'), text: label_for_entry(t('text.homepage_admin')) }, admin_root_path, highlights_on: /\A\/admin\z/
      menu.item :users,          *menu_entry_for_model('User', namespace: :admin)
      menu.item :settings,       { icon: icon_for_entry('fa-gear'),      text: label_for_entry(t('text.settings')) }, admin_settings_path
      menu.item :logster,        { icon: icon_for_entry('fa-book'),      text: label_for_entry(t('text.logster')) }, logster_web_path, link_html: { target: '_blank' }
      menu.item :sidekiq,        { icon: icon_for_entry('fa-gears'),     text: label_for_entry(t('text.sidekiq')) }, sidekiq_web_path, link_html: { target: '_blank' }
      menu.item :monitoring,     { icon: icon_for_entry('fa-heartbeat'), text: label_for_entry(t('text.monitoring')) }, health_monitor.check_path, link_html: { target: '_blank' }
    end

    menu.item :main_app,       { icon: icon_for_entry('fa-arrow-circle-left'), text: label_for_entry(t('text.back_to_app')) }, root_path, highlights_on: %r(//)
  end
end
