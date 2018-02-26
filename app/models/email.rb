# frozen_string_literal: true

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

class Email < ApplicationRecord

  # Relations
  belongs_to :mailing_list, inverse_of: :emails


  def to_s
    email
  end
end
