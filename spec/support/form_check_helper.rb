RSpec.shared_context 'invalid_form_check' do |fields, opts|

  key     = opts.fetch(:key)
  factory = opts.fetch(:factory)

  _form_param = opts.fetch(:form_param, {})
  _op_params  = respond_to?(:operation_params) ? operation_params : {}

  fields.each do |field, errors|
    context "when #{field} is empty" do
      it 'should not be valid' do
        params = { params: { key => attributes_for(factory).merge(_form_param).merge(field => '') } }
        result = described_class.(params.merge(_op_params))

        expect(result['contract.default'].errors.messages).to eq({
          field.to_sym => errors,
        })
      end
    end
  end
end

RSpec.shared_context 'valid_email_check' do |fields, opts|

  key     = opts.fetch(:key)
  factory = opts.fetch(:factory)

  _form_param = opts.fetch(:form_param, {})
  _op_params  = respond_to?(:operation_params) ? operation_params : {}

  fields.each do |field|
    VALID_MAIL_ADDRESSES.each do |email|
      describe "valid email creation : #{email} for field #{field}" do
        it 'should be valid' do
          params = { params: { key => attributes_for(factory, field => email).merge(_form_param) } }
          result = described_class.(params.merge(_op_params))

          expect(result.success?).to be true
          expect(result[:model].persisted?).to be true
        end
      end
    end
  end
end

RSpec.shared_context 'invalid_email_check' do |fields, opts|

  key     = opts.fetch(:key)
  factory = opts.fetch(:factory)

  _form_param = opts.fetch(:form_param, {})
  _op_params  = respond_to?(:operation_params) ? operation_params : {}

  fields.each do |field|
    INVALID_MAIL_ADDRESSES.each do |email|
      describe "invalid email creation : #{email} for field #{field}" do
        it 'should not be valid' do
          params = { params: { key => attributes_for(factory, field => email).merge(_form_param) } }
          result = described_class.(params.merge(_op_params))

          expect(result['contract.default'].errors.messages).to eq({
            field.to_sym => ["n'est pas valide"]
          })
        end
      end
    end
  end
end
