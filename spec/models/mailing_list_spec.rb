require 'rails_helper'

describe MailingList do

  let(:mailing_list) { build(:mailing_list) }

  subject { mailing_list }

  it { should be_valid }

  ## Relations validation
  it { should have_many(:emails).inverse_of(:mailing_list) }
end
