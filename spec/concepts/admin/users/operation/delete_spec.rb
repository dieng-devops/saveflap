require 'rails_helper'

describe Admin::Users::Delete do

  let(:user) { create_user }

  describe 'valid deletion' do
    it 'should delete user' do
      result =
        described_class.(
          id: user.id,
        )

      expect(result.success?).to be true
      expect(result['model'].destroyed?).to be true
    end
  end
end
