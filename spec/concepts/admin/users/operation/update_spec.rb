require 'rails_helper'

describe Admin::Users::Update do

  let(:user) { create_user }

  describe 'valid update' do
    it 'should update user' do
      params = { id: user.id, user: { first_name: 'Foo' } }
      result = described_class.(params: params)

      expect(result.success?).to be true
      expect(result[:model].first_name).to eq 'Foo'
    end
  end

end
