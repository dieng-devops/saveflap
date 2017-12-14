require 'rails_helper'

describe MailingLists::Create do

  describe 'valid creation' do
    context 'with valid params' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list_tb)) }

      it { expect(result.success?).to be true }
      it { expect(result['model'].persisted?).to be true }
    end
  end

  describe 'invalid creation' do
    context 'when name is empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list_tb, name: '')) }
      it {
        expect(result['contract.default'].errors.messages).to eq({
          name: ["doit être rempli(e)"],
        })
      }
    end

    context 'when name is already taken' do
      before { described_class.(mailing_list: attributes_for(:mailing_list_tb, name: 'Foo')) }
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list_tb, name: 'Foo')) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          name: ["n'est pas disponible"],
        })
      }
    end

    context 'when emails attributes are empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo')) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          "emails.email": ["doit être rempli(e)", "n'est pas valide"],
          "emails.first_name": ["doit être rempli(e)"],
          "emails.last_name": ["doit être rempli(e)"],
        })
      }
    end

    context 'when email.first_name is empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo').merge(emails_attributes: { '0' => { last_name: Faker::Name.last_name, email: Faker::Internet.email } })) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          "emails.first_name": ["doit être rempli(e)"],
        })
      }
    end

    context 'when email.last_name is empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, email: Faker::Internet.email } })) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          "emails.last_name": ["doit être rempli(e)"],
        })
      }
    end

    context 'when email.email is empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name } })) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          "emails.email": ["doit être rempli(e)", "n'est pas valide"],
        })
      }
    end

    INVALID_MAIL_ADDRESSES.each do |email|
      context 'when email.email is invalid' do
        let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: email } })) }

        it {
          expect(result['contract.default'].errors.messages).to eq({
            "emails.email": ["n'est pas valide"],
          })
        }
      end
    end
  end

end
