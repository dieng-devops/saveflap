class MailingList < ApplicationRecord

  # Validation
  validates :name, uniqueness: true


  def to_s
    name
  end
end
