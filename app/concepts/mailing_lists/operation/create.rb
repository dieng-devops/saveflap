# frozen_string_literal: true

class MailingLists::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(MailingList, :new)
    step Contract::Build(constant: MailingLists::Contract::Create)
  end

  step Policy::Pundit::Params(MailingListPolicy, key: :mailing_list)
  step Nested(Present)
  step Contract::Validate(key: :mailing_list)
  step Contract::Persist()
  step :update_ldap!


  def update_ldap!(_options, model:, **)
    params = { email: model.email, emails: model.emails.map(&:email), description: model.name }
    LDAP::Create.(params: params)
  end
end
