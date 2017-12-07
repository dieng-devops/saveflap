class MailingLists::Update < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(MailingList, :find)
    step Contract::Build(constant: MailingLists::Contract::Create)
  end

  step Nested(Present)
  step Policy::Pundit::Params(MailingListPolicy, key: :mailing_list)
  step Contract::Validate(key: :mailing_list)
  step Contract::Persist()
end
