require 'rails_helper'

describe MailingLists::Create do

  describe 'valid creation' do
    context 'with valid params' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo')) }

      it { expect(result.success?).to be true }
      it { expect(result['model'].persisted?).to be true }
      it { expect(result['model'].name).to eq 'Foo' }
    end
  end

  describe 'invalid creation' do
    context 'when name is empty' do
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: '')) }
      it {
        expect(result['contract.default'].errors.messages).to eq({
          name: ["doit être rempli(e)"],
        })
      }
    end

    context 'when name is already taken' do
      before { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo')) }
      let(:result) { described_class.(mailing_list: attributes_for(:mailing_list, name: 'Foo')) }

      it {
        expect(result['contract.default'].errors.messages).to eq({
          name: ["n'est pas disponible"],
        })
      }
    end

  end

end
