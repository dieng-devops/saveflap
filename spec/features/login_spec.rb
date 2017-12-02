require 'rails_helper'

feature 'Login', js: true do
  scenario 'When existing user try to login' do
    create_user(email: 'toto@example.net', create_options: 'manual', password: 'blabla', password_confirmation: 'blabla')
    load_server_host
    visit main_app.root_path
    fill_in :user_email, with: 'toto@example.net'
    fill_in :user_password, with: 'blabla'
    find('[type=submit]').click
    expect(page).to have_content('Accueil')
  end

  scenario 'When disabled user try to login' do
    create_user(email: 'toto@example.net', create_options: 'manual', password: 'blabla', password_confirmation: 'blabla', enabled: false)
    load_server_host
    visit main_app.root_path
    fill_in :user_email, with: 'toto@example.net'
    fill_in :user_password, with: 'blabla'
    find('[type=submit]').click
    expect(page).to have_content('Compte inactif')
  end
end
