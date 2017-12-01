require 'rails_helper'

feature 'Admin Welcome Page ', js: true do

  scenario 'Normal users cannot see Admin Welcome Page ' do
    visit_as :user, main_app.admin_root_path
    expect(page).to have_content('403')
  end

  scenario 'Admin users can see Admin Welcome Page ' do
    visit_as :admin, main_app.admin_root_path
    assert_page_title 'FLAP! Admin'
  end

end
