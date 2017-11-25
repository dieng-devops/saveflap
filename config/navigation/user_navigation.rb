SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |menu|
    menu.dom_id = 'side-menu'
    menu.dom_class = 'nav'
    menu.item :homepage,  { icon: icon_for_entry('fa-home'), text: label_for_entry(t('text.homepage')) }, root_path, highlights_on: /\A\/\z/
  end
end
