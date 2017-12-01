class Admin::User::Password < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :find_by)
    step Contract::Build(constant: Admin::User::Contract::Password)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
  step :notify!


  def notify!(options, current_user:, model:, **)
    form = options['contract.default']
    if form.send_email?
      DeviseMailer.password_change(model, password: form.created_password).deliver_now
    end
    true
  end

end
