require 'rails_helper'

feature 'My Account', js: true do

  scenario 'User can edit his account infos' do
    visit_as :user, main_app.my_account_path
    fill_in :user_first_name, with: 'Foo'
    fill_in :user_last_name, with: 'Bar'
    find('[type=submit]').click
    assert_page_title 'Foo Bar'
  end

  scenario 'User can edit his password' do
    visit_as :user, main_app.my_account_path
    click_link 'Changer de mot de passe'
    assert_page_title 'Changement de mot de passe'
  end
end
