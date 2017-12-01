Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Fix error : undefined method `cast_type' for #<ActiveRecord::ConnectionAdapters::PostgreSQLColumn:0x000000098170c8>
# See https://github.com/thoughtbot/shoulda-matchers/issues/913
module Shoulda
  module Matchers
    RailsShim.class_eval do
      def self.serialized_attributes_for(model)
        if defined?(::ActiveRecord::Type::Serialized)
          # Rails 5+
          model.columns.select do |column|
            model.type_for_attribute(column.name).is_a?(::ActiveRecord::Type::Serialized)
          end.inject({}) do |hash, column|
            hash[column.name.to_s] = model.type_for_attribute(column.name).coder
            hash
          end
        else
          model.serialized_attributes
        end
      end
    end
  end
end

require 'shoulda/matchers/action_controller/permit_matcher'

module PermitMatcherPatch
  def self.included(base)
    base.send(:prepend, InstanceMethods)
  end

  module InstanceMethods
    def matches?(controller)
      @controller = controller
      ensure_action_and_verb_present!

      parameters_double_registry.register

      Shoulda::Matchers::Doublespeak.with_doubles_activated do
        context.__send__(verb, action, params: request_params)
      end

      unpermitted_parameter_names.empty?
    end
  end
end

unless Shoulda::Matchers::ActionController::PermitMatcher.included_modules.include?(PermitMatcherPatch)
  Shoulda::Matchers::ActionController::PermitMatcher.send(:include, PermitMatcherPatch)
end
