class Admin::User::Password < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :find_by)
    step Contract::Build(constant: Admin::User::Contract::Password)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
