def create_user(opts = {})
  opts = { create_options: 'generate' }.merge(opts)
  factory(Admin::Users::Create, user: attributes_for(:user).merge(opts))['model']
end
