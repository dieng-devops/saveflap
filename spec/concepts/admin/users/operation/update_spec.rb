require 'rails_helper'

describe Admin::Users::Update do

  let(:user) { create_user }

  describe 'valid update' do
    it 'should update user' do
      result =
        described_class.(
          id: user.id, user: { first_name: 'Foo' },
        )

      expect(result.success?).to be true
      expect(result['model'].first_name).to eq 'Foo'
    end
  end

end
