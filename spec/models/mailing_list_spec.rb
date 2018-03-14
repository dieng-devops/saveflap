# == Schema Information
#
# Table name: mailing_lists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  enabled     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  email       :string(255)
#
# Indexes
#
#  index_mailing_lists_on_email  (email) UNIQUE
#

require 'rails_helper'

describe MailingList do

  let(:mailing_list) { build(:mailing_list) }

  subject { mailing_list }

  it { should be_valid }

  ## Relations validation
  it { should have_many(:emails).inverse_of(:mailing_list) }
end
