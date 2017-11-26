class User::Update < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step :setup_user
    step Contract::Build(constant: User::Contract::Update)

    def setup_user(options, params:, **)
      options['model'] = options['current_user']
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
