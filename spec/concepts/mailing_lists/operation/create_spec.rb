require 'rails_helper'

describe MailingLists::Create do

  describe 'valid creation' do
    context 'with valid params' do
      it 'should be persisted' do
        # Stub LDAP::Update on MailingLists creation
        stub_operation(LDAP::Create)

        params = { mailing_list: attributes_for(:mailing_list_tb) }
        result = described_class.(params: params)

        expect(result.success?).to be true
        expect(result[:model].persisted?).to be true
      end
    end
  end

  describe 'invalid creation' do
    context 'when name is empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list_tb, name: '') }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          name: ["doit être rempli(e)"],
        })
      end
    end

    context 'when email is empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list_tb, email: '') }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          email: ["doit être rempli(e)", "n'est pas valide"],
        })
      end
    end

    context 'when email is not an email' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list_tb, email: 'foo') }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          email: ["n'est pas valide"],
        })
      end
    end

    context 'when email is already taken' do
      before {
        # Stub LDAP::Update on MailingLists creation
        stub_operation(LDAP::Create)
        described_class.(params: { mailing_list: attributes_for(:mailing_list_tb, email: 'foo@foo.com') })
      }

      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list_tb, email: 'foo@foo.com') }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          email: ["n'est pas disponible"],
        })
      end
    end

    context 'when emails attributes are empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list, email: 'foo@foo.com') }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          "emails.email": ["doit être rempli(e)", "n'est pas valide"],
          "emails.first_name": ["doit être rempli(e)"],
          "emails.last_name": ["doit être rempli(e)"],
        })
      end
    end

    context 'when email.first_name is empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list, email: 'foo@foo.com').merge(emails_attributes: { '0' => { last_name: Faker::Name.last_name, email: Faker::Internet.email } }) }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          "emails.first_name": ["doit être rempli(e)"],
        })
      end
    end

    context 'when email.last_name is empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list, email: 'foo@foo.com').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, email: Faker::Internet.email } }) }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          "emails.last_name": ["doit être rempli(e)"],
        })
      end
    end

    context 'when email.email is empty' do
      it 'should not be persisted' do
        params = { mailing_list: attributes_for(:mailing_list, email: 'foo@foo.com').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name } }) }
        result = described_class.(params: params)

        expect(result['contract.default'].errors.messages).to eq({
          "emails.email": ["doit être rempli(e)", "n'est pas valide"],
        })
      end
    end

    INVALID_MAIL_ADDRESSES.each do |email|
      context 'when email.email is invalid' do
        it 'should not be persisted' do
          params = { mailing_list: attributes_for(:mailing_list, email: 'foo@foo.com').merge(emails_attributes: { '0' => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: email } }) }
          result = described_class.(params: params)

          expect(result['contract.default'].errors.messages).to eq({
            "emails.email": ["n'est pas valide"],
          })
        end
      end
    end

  end

end
