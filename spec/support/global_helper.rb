def create_user(opts = {})
  opts = { create_options: 'generate' }.merge(opts)
  factory(Admin::User::Create, user: attributes_for(:user).merge(opts))['model']
end
