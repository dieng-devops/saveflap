require 'rails_helper'

describe MailingList do

  let(:mailing_list) { build(:mailing_list) }

  subject { mailing_list }

  it { should be_valid }

end
