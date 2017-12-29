require 'rails_helper'

describe Admin::Users::Create do

  describe 'valid creation' do
    let(:result) { described_class.(user: attributes_for(:user).merge(create_options: 'generate')) }

    it { expect(result.success?).to be true }
    it { expect(result['model'].persisted?).to be true }

    include_context 'valid_email_check', %w(email), key: :user, factory: :user, form_param: { create_options: 'generate' }
  end

  describe 'create options' do
    context 'when send_by_mail is true' do
      it 'should send an email' do
        expect {
          described_class.(user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: true))
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'when send_by_mail is 1' do
      it 'should send an email' do
        expect {
          described_class.(user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: '1'))
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end


  describe 'invalid creation' do
    fields =
      {
        first_name: ["doit être rempli(e)"],
        last_name:  ["doit être rempli(e)"],
        email:      ["doit être rempli(e)"],
        time_zone:  ["doit être rempli(e)"],
        language:   ["doit être rempli(e)"],
      }

    include_context 'invalid_form_check',
      fields,
      key:        :user,
      factory:    :user,
      form_param: { create_options: 'generate' }

    include_context 'invalid_email_check',
      %w(email),
      key:        :user,
      factory:    :user,
      form_param: { create_options: 'generate' }

  end
end
