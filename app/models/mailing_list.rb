class MailingList < ApplicationRecord

  # Relations
  has_many :emails, inverse_of: :mailing_list

  # Validations
  validates :name, uniqueness: true


  def to_s
    name
  end
end
