require 'logster/logger'

# See https://github.com/discourse/logster/issues/56

module Flap
  module CoreExt
    module LogsterPatch
      module LogsterLoggerPatch

        def silence(*)
          yield self
        end

      end
    end
  end
end

unless Logster::Logger.included_modules.include?(Flap::CoreExt::LogsterPatch::LogsterLoggerPatch)
  Logster::Logger.send(:prepend, Flap::CoreExt::LogsterPatch::LogsterLoggerPatch)
end
