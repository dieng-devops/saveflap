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
      ! @success
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

        @form  = result["contract.default"]
        @model = result["model"]

        yield(result) if result.success? && block_given?

        @_result = result
      end
    end

  end
end

ActionForm::Base.prepend(Flap::CoreExt::ActionFormPatch)
Trailblazer::Rails::Controller.prepend(Flap::CoreExt::TrailblazerPatch)
