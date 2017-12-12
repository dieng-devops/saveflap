class Email < ApplicationRecord

  # Relations
  belongs_to :mailing_list, inverse_of: :emails


  def to_s
    email
  end
end
