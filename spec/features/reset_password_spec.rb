require 'rails_helper'

feature 'Reset password', js: true do

  scenario 'Existing user can reset his password' do
    create_user(email: 'toto@example.net')
    visit main_app.root_path
    click_link 'Mot de passe oublié?'
    expect(page).to have_content('Entrez votre adresse email')
    fill_in :user_email, with: 'toto@example.net'

    expect { find('[type=submit]').click }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end
