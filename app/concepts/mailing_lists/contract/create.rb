module MailingLists::Contract
  class Create < ActionForm::Base
    self.main_model = :mailing_list

    attribute :name, required: true
    attribute :description
    attribute :enabled
  end
end
