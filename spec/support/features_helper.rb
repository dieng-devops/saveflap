module FeaturesHelper

  def sign_as(user_type)
    user = FactoryBot.create(user_type, password: 'blabla', password_confirmation: 'blabla')
    signin(user)
  end


  def signin(user)
    load_server_host
    visit main_app.root_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: 'blabla'
    find("[type=submit]").click
  end


  def load_server_host
    Capybara.server_host = Settings.application_domain
    Capybara.app_host = Settings.application_url
  end

end
