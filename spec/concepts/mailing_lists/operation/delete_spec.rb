require 'rails_helper'

describe MailingLists::Delete do

  let(:mailing_list) {

    # Stub LDAP::Update on MailingLists creation
    fake_result = double('result')
    expect(LDAP::Update).to receive(:call).and_return(fake_result)
    expect(fake_result).to receive(:success?).and_return(true)

    create_object(MailingLists::Create, :mailing_list, :mailing_list_tb)
  }

  context 'when user is a Commercial' do
    describe 'valid deletion' do
      it 'should soft delete record' do
        result =
          described_class.(
            { id: mailing_list.id },
          )

        expect(result.success?).to be true
        expect(result['model'].destroyed?).to be true
      end
    end
  end
end
