require 'rails_helper'

describe MailingLists::Delete do

  let(:mailing_list) {
    # Stub LDAP::Update on MailingLists creation
    stub_operation(LDAP::Create)
    create_object(MailingLists::Create, :mailing_list, :mailing_list_tb)
  }

  context 'when user is a Commercial' do
    describe 'valid deletion' do
      it 'should soft delete record' do
        params = { id: mailing_list.id }
        result = described_class.(params: params)

        expect(result.success?).to be true
        expect(result[:model].destroyed?).to be true
      end
    end
  end
end
