class Users::Update < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step :setup_user
    step Contract::Build(constant: Users::Contract::Update)

    def setup_user(options, params:, **)
      options['model'] = options['current_user']
    end
  end

  step Nested(Present)
  step Policy::Pundit::Params(UserPolicy, key: :user)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
