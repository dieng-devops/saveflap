# == Schema Information
#
# Table name: emails
#
#  id              :integer          not null, primary key
#  mailing_list_id :integer
#  email           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe Email do

  let(:email) { build(:email) }

  subject { email }

  it { should be_valid }

  ## Relations validation
  it { should belong_to(:mailing_list).inverse_of(:emails) }
end
