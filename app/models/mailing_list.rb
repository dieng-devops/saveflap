class MailingList < ApplicationRecord

  # Relations
  has_many :emails

  # Validations
  validates :name, uniqueness: true


  def to_s
    name
  end
end
