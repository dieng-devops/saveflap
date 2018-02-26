# frozen_string_literal: true

class MailingLists::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options['model'] = MailingList.all.order(name: :asc)
  end
end
