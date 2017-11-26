SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |menu|
    menu.dom_class = 'navbar-top-links navbar-right'
    menu.item :logged, icon('user'), '#', highlights_on: %r(/my), class: 'dropdown' do |sub_menu|
      sub_menu.auto_highlight = false
      sub_menu.item :my_account, { icon: icon_for_entry('fa-user'),     text: label_for_entry(t('text.my_account')) }, my_account_path, highlights_on: %r(/my)
      sub_menu.item :divider,    *menu_divider
      sub_menu.item :logout,     { icon: icon_for_entry('fa-sign-out'), text: label_for_entry(t('text.logout')) }, destroy_user_session_path, method: :delete
    end
  end
end
