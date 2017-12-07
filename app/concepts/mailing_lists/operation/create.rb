class MailingLists::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(MailingList, :new)
    step Contract::Build(constant: MailingLists::Contract::Create)
  end

  step Nested(Present)
  step Policy::Pundit::Params(MailingListPolicy, key: :mailing_list)
  step Contract::Validate(key: :mailing_list)
  step Contract::Persist()
end
