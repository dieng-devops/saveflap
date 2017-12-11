class MailingLists::Show < Trailblazer::Operation
  step Model(MailingList, :find)
end
