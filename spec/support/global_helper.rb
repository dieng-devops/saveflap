def create_user(opts = {})
  opts = { create_options: 'generate' }.merge(opts)
  factory(Admin::Users::Create, user: attributes_for(:user).merge(opts))['model']
end

def create_object(klass, key, attributes = nil)
  attributes = attributes || key
  factory(
    klass,
    { key => attributes_for(attributes) },
  )['model']
end
