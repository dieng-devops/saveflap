class Admin::Users::Update < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :find)
    step Contract::Build(constant: Admin::Users::Contract::Update)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
