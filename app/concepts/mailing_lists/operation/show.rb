# frozen_string_literal: true

class MailingLists::Show < Trailblazer::Operation
  step Model(MailingList, :find)
end
