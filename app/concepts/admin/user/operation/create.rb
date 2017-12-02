class Admin::User::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Admin::User::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
  step :notify!


  def notify!(options, model:, **)
    form = options['contract.default']
    if form.send_email?
      DeviseMailer.welcome(model, password: form.created_password).deliver_now
    end
    true
  end

end
