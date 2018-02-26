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
#
# Indexes
#
#  index_mailing_lists_on_name  (name) UNIQUE
#

class MailingList < ApplicationRecord

  # Relations
  has_many :emails, inverse_of: :mailing_list, dependent: :destroy

  # Validations
  validates :name, uniqueness: true


  def to_s
    name
  end
end
