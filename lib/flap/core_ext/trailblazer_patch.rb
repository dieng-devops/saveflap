# frozen_string_literal: true

# Define our own Result object to respect Trailblazer expectations
# See: https://github.com/trailblazer/reform/blob/master/lib/reform/form/call.rb
module Contract
  class Result < SimpleDelegator
    def initialize(success, data)
      @success = success
      super(data)
    end

    def success?
      @success
    end

    def failure?
      !@success
    end
  end
end

# Define our own Trailblazer::Operation to apply strong_params policy (with Pundit)
# on params injected in Trailblazer::Contract
class Trailblazer::Operation
  module Policy
    module Pundit

      def self.Params(policy_class, key:, method: :permitted_attributes, name: :default)
        Policy.step Params.build(policy_class, key, method), name: name
      end

      module Params

        def self.build(*args, &block)
          Condition.new(*args, &block)
        end

        class Condition
          def initialize(policy_class, key, method)
            @policy_class, @key, @method = policy_class, key, method
          end


          def call(_input, options)
            if options['params'].respond_to?(:require)
              policy = build_policy(options)
              params = options['params'].require(@key.to_sym).permit(*policy.public_send(@method))
              options['params'][@key.to_s] = params
            end
            Result.new(true, {})
          end

          private

          def build_policy(options)
            @policy_class.new(options['current_user'], options['model'])
          end
        end

      end

    end
  end
end

module Flap
  module CoreExt

    # Add '#call' wrapper method to ActionForm::Base
    # A '#call' method is required by Trailblazer::Operation as a convention
    module ActionFormPatch
      def call(params = {})
        submit(params)
        bool = valid?
        ::Contract::Result.new(bool, self)
      end
    end

    # Override Trailblazer::Rails::Controller#run to bypass the use of Trailblazer::Rails:Form object
    # (useless and break form attributes translations)
    # See: https://github.com/trailblazer/trailblazer-rails/blob/master/lib/trailblazer/rails/controller.rb
    module TrailblazerPatch
      def run(operation, params=self.params, *dependencies)
        result = operation.(
          _run_params(params),
          *_run_runtime_options(*dependencies)
        )

        @form  = result['contract.default']
        @model = result['model']

        yield(result) if result.success? && block_given?

        @_result = result
      end
    end

  end
end

# Patch ActionForm with our patch
ActionForm::Base.prepend(Flap::CoreExt::ActionFormPatch)

# Include ActiveModel::Validations::Callbacks in ActionForm::Base
# so we can use *before_validation* in our contracts (form objects).
ActionForm::Base.include(ActiveModel::Validations::Callbacks)

# Patch Trailblazer with our patch
Trailblazer::Rails::Controller.prepend(Flap::CoreExt::TrailblazerPatch)
