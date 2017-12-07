class MailingLists::Delete < Trailblazer::Operation
  step Model(MailingList, :find)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end
