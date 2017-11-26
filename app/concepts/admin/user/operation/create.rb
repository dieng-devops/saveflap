class Admin::User::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Admin::User::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
