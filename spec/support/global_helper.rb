def create_user(opts = {})
  opts = { create_options: 'generate' }.merge(opts)
  params = { params: { user: attributes_for(:user).merge(opts) } }
  factory(Admin::Users::Create, params)[:model]
end

def create_object(klass, key, attributes = nil)
  attributes = attributes || key
  params = { params: { key => attributes_for(attributes) } }
  factory(klass, params)[:model]
end

def stub_operation(klass)
  fake_result = double('result')
  expect(klass).to receive(:call).and_return(fake_result)
  # expect(fake_result).to receive(:success?).and_return(true)
end
