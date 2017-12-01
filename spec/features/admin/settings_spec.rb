require 'rails_helper'

feature 'Settings', js: true do

  scenario 'Normal users cannot see Settings' do
    visit_as :user, main_app.admin_settings_path
    expect(page).to have_content('403')
  end

  scenario 'Admin users can see Settings' do
    visit_as :admin, main_app.admin_settings_path
    assert_page_title 'Paramètres'
  end

end
