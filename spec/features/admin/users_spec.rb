require 'rails_helper'

feature 'Users', js: true do

  def prepare_index_page
    create_user(admin: true, first_name: 'To', last_name: 'edit')
    create_user(first_name: 'To', last_name: 'delete')
  end

  scenario 'Normal users cannot manage Users' do
    visit_as :user, main_app.admin_users_path
    expect(page).to have_content('403')
  end

  scenario 'Admin user can manage Users' do
    prepare_index_page
    visit_as :admin, main_app.admin_users_path

    assert_page_title 'Utilisateurs'
    assert_table_entries 'users-table', 3
  end

  describe 'Admin user can create Users' do
    before do
      prepare_index_page
      visit_as :admin, main_app.admin_users_path

      assert_page_title 'Utilisateurs'
      assert_table_entries 'users-table', 3
    end

    scenario 'with valid data' do
      create_new_entry do
        fill_in :user_first_name, with: 'Foo'
        fill_in :user_last_name,  with: 'Bar'
        fill_in :user_email,      with: 'foo@bar.com'
        choose  :user_create_options_generate
      end

      assert_table_entries 'users-table', 4
    end

    scenario 'with invalid data' do
      create_new_entry do
        fill_in :user_first_name, with: 'Foo'
        fill_in :user_last_name,  with: 'Bar'
        fill_in :user_email,      with: 'foo@bar.com'
      end

      expect(page).to have_content('doit être rempli')
    end
  end

  scenario 'Admin user can edit Users' do
    prepare_index_page
    visit_as :admin, main_app.admin_users_path

    assert_page_title 'Utilisateurs'
    assert_table_entries 'users-table', 3

    edit_table_entry 'users-table', 'To edit' do
      fill_in :user_last_name, with: 'edit done'
    end

    assert_table_entries 'users-table', 3
    assert_table_contains 'users-table', 'To edit done'
  end

  scenario 'Admin user can delete Users' do
    prepare_index_page
    visit_as :admin, main_app.admin_users_path

    assert_page_title 'Utilisateurs'
    assert_table_entries 'users-table', 3

    delete_table_entry 'users-table', 'To delete'

    assert_table_entries 'users-table', 2
  end

  scenario 'Admin user can edit Users password' do
    user = create_user
    visit_as :admin, main_app.change_password_admin_user_path(user)

    assert_page_title 'Changement de mot de passe'
    choose 'Générer un mot de passe'
    check "Envoyer les informations à l'utilisateur par mail"

    expect { find("[type=submit]").click }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
