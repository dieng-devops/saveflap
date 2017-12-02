require 'rails_helper'

describe Admin::User::Create, type: :model do

  VALID_MAIL_ADDRESSES   = %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn).freeze
  INVALID_MAIL_ADDRESSES = %w(user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo.bar.@gmail.com foo@bar+baz.com).freeze

  describe 'valid creation' do
    let(:user) { described_class.(user: attributes_for(:user, first_name: 'Bob').merge(create_options: 'generate')) }

    it { expect(user.success?).to be true }
    it { expect(user['model'].persisted?).to be true }
    it { expect(user['model'].first_name).to eq 'Bob' }
  end

  VALID_MAIL_ADDRESSES.each do |email|
    describe "valid email creation : #{email}" do
      let(:user) { described_class.(user: attributes_for(:user, first_name: 'Bob', email: email).merge(create_options: 'generate')) }
      it { expect(user.success?).to be true }
      it { expect(user['model'].persisted?).to be true }
      it { expect(user['model'].first_name).to eq 'Bob' }
      it { expect(user['model'].email).to eq email.downcase }
    end
  end

  INVALID_MAIL_ADDRESSES.each do |email|
    describe "invalid email creation : #{email}" do
      let(:user) { described_class.(user: attributes_for(:user, first_name: 'Bob', email: email).merge(create_options: 'generate')) }
      it { expect(user.success?).to be false }
      it { expect(user['model'].persisted?).to be false }
      it { expect(user['contract.default'].errors.messages.keys).to eq [:email] }
    end
  end

  describe 'create options' do
    context 'when send_by_mail is true' do
      let(:user) { described_class.(user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: true)) }

      it 'should send an email' do
        expect(ActionMailer::Base.deliveries.count).to eq 0
        expect(user.success?).to be true
        expect(user['model'].persisted?).to be true
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
    end

    context 'when send_by_mail is 1' do
      let(:user) { described_class.(user: attributes_for(:user).merge(create_options: 'generate', send_by_mail: '1')) }

      it 'should send an email' do
        expect(ActionMailer::Base.deliveries.count).to eq 0
        expect(user.success?).to be true
        expect(user['model'].persisted?).to be true
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
    end
  end
end
