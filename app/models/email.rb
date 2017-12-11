class Email < ApplicationRecord

  # Relations
  belongs_to :mailing_list


  def to_s
    email
  end
end
