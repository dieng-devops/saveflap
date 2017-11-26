class Admin::User::Update < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :find_by)
    step Contract::Build(constant: Admin::User::Contract::Update)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
