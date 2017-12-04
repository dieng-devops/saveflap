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


  def visit_as(user_type, route)
    sign_as(user_type)
    visit route
  end


  def assert_page_title(content)
    expect(find('#page-wrapper').find('h2.page-header').text).to eq content
  end


  def assert_table_entries(table, entries)
    xpath = ".//table[@id='#{table}']//tbody//tr"
    expect(page).to have_xpath(xpath, count: entries)
  end


  def create_new_entry(label = 'Ajouter')
    find_link(label).click
    yield
    find("[type=submit]").click
  end


  def edit_table_entry(table, entry)
    within_table(table) do
      find('tr', text: entry).click_link(entry)
    end

    yield

    find("[type=submit]").click
  end


  def delete_table_entry(table, entry)
    within_table(table) do
      accept_alert do
        find('tr', text: entry).click_link('Supprimer')
      end
    end
  end


  def assert_table_contains(table, string)
    xpath = ".//table[@id='#{table}']//tbody//tr"
    expect(page).to have_xpath(xpath, count: 1, text: string)
  end

end
