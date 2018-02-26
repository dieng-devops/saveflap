# frozen_string_literal: true

class Admin::Users::Delete < Trailblazer::Operation
  step Model(User, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
