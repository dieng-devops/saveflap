require 'rails_helper'

describe MailingLists::Update do

  let(:mailing_list) {
    # Stub LDAP::Update on MailingLists creation
    stub_operation(LDAP::Create)
    create_object(MailingLists::Create, :mailing_list, :mailing_list_tb)
  }

  context 'when user is a Commercial' do
    describe 'valid update' do
      it 'should update record' do

        # Stub LDAP::Update on MailingLists update
        stub_operation(LDAP::Update)

        result =
          described_class.(
            { id: mailing_list.id, mailing_list: { name: 'bar@bar.com' } },
          )

        expect(result.success?).to be true
        expect(result['model'].name).to eq 'bar@bar.com'
      end
    end
  end
end
