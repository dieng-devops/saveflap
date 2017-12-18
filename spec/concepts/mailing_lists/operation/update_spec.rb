require 'rails_helper'

describe MailingLists::Update do

  let(:mailing_list) {

    # Stub LDAP::Update on MailingLists creation
    fake_result = double('result')
    expect(LDAP::Update).to receive(:call).and_return(fake_result)
    expect(fake_result).to receive(:success?).and_return(true)

    create_object(MailingLists::Create, :mailing_list, :mailing_list_tb)
  }

  context 'when user is a Commercial' do
    describe 'valid update' do
      it 'should update record' do

        # Stub LDAP::Update on MailingLists update
        fake_result = double('result')
        expect(LDAP::Update).to receive(:call).and_return(fake_result)
        expect(fake_result).to receive(:success?).and_return(true)

        result =
          described_class.(
            { id: mailing_list.id, mailing_list: { name: 'Foo' } },
          )

        expect(result.success?).to be true
        expect(result['model'].name).to eq 'Foo'
      end
    end
  end
end
