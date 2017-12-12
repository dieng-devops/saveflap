require 'rails_helper'

describe Email do

  let(:email) { build(:email) }

  subject { email }

  it { should be_valid }

  ## Relations validation
  it { should belong_to(:mailing_list).inverse_of(:emails) }
end
