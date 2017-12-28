class MailingLists::Delete < Trailblazer::Operation
  step Model(MailingList, :find)
  step :delete!
  step :update_ldap!


  def delete!(options, model:, **)
    model.destroy
  end

  def update_ldap!(options, model:, **)
    LDAP::Delete.(name: model.name)
  end
end
