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
    module ActionFormPatch
      def call(params = {})
        submit(params)
        bool = valid?
        ::Contract::Result.new(bool, self)
      end
    end
  end
end

ActionForm::Base.prepend(Flap::CoreExt::ActionFormPatch)
