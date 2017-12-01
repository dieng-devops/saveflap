require 'rails_helper'

feature 'Login', js: true do
  scenario 'When existing user try to login' do
    FactoryBot.create(:user, email: "toto@jbox-web.com", password: 'blabla', password_confirmation: 'blabla')
    load_server_host
    visit main_app.root_path
    fill_in :user_email, with: 'toto@jbox-web.com'
    fill_in :user_password, with: 'blabla'
    find("[type=submit]").click
    expect(page).to have_content('Accueil')
  end

  scenario 'When disabled user try to login' do
    FactoryBot.create(:user, email: "toto@jbox-web.com", password: 'blabla', password_confirmation: 'blabla', enabled: false)
    load_server_host
    visit main_app.root_path
    fill_in :user_email, with: 'toto@jbox-web.com'
    fill_in :user_password, with: 'blabla'
    find("[type=submit]").click
    expect(page).to have_content('Compte inactif')
  end
end
