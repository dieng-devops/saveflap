class Admin::Users::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Admin::Users::Contract::Create)
  end

  step Nested(Present)
  step Policy::Pundit::Params(Admin::UserPolicy, key: :user, method: :permitted_attributes_for_create)
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
