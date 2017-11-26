SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |menu|
    menu.dom_id = 'side-menu'
    menu.dom_class = 'nav'
    menu.item :homepage,       { icon: icon_for_entry('fa-home'), text: label_for_entry(t('text.homepage_admin')) }, admin_root_path, highlights_on: /\A\/admin\z/
    menu.item :users,          *menu_entry_for_model('User', namespace: :admin)
    menu.item :main_app,       { icon: icon_for_entry('fa-arrow-circle-left'), text: label_for_entry(t('text.back_to_app')) }, root_path, highlights_on: %r(//)
  end
end
