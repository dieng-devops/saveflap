require 'rails_helper'

describe MailingLists::Delete do

  let(:mailing_list) { create_object(MailingLists::Create, :mailing_list, :mailing_list_tb) }

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
