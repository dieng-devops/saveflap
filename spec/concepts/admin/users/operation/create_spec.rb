require 'rails_helper'

describe Admin::Users::Create do

  describe 'valid creation' do
    it 'should be persisted' do
      params = { user: attributes_for(:user).merge(create_options: 'generate') }
      result = described_class.(params: params)

      expect(result.success?).to be true
      expect(result[:model].persisted?).to be true
    end

    include_context 'valid_email_check', %w(email), key: :user, factory: :user, form_param: { create_options: 'generate' }
  end

  describe 'create options' do
    context 'when send_by_mail is true' do
      it 'should send an email' do
        params = { user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: true) }
        expect {
          described_class.(params: params)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'when send_by_mail is 1' do
      it 'should send an email' do
        params = { user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: '1') }
        expect {
          described_class.(params: params)
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
