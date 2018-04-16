require 'rails_helper'

describe Admin::Users::Delete do

  let(:user) { create_user }

  describe 'valid deletion' do
    it 'should delete user' do
      params = { id: user.id }
      result = described_class.(params: params)

      expect(result.success?).to be true
      expect(result[:model].destroyed?).to be true
    end
  end
end
