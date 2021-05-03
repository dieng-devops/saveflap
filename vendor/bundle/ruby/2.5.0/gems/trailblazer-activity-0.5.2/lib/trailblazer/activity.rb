require "trailblazer/activity/version"

module Trailblazer
  def self.Activity(implementation=Activity::Path, options={})
    Activity.new(implementation, state)
  end

  class Activity < Module
    attr_reader :initial_state

    def initialize(implementation, options)
      builder, adds, circuit, outputs, options = BuildState.build_state_for( implementation.config, options)

      @initial_state = State::Config.build(
        builder: builder,
        options: options,
        adds:    adds,
        circuit: circuit,
        outputs: outputs,
      )

      include *options[:extend] # include the DSL methods.
      include PublicAPI
    end

    # Injects the initial configuration into the module defining a new activity.
    def extended(extended)
      super
      extended.instance_variable_set(:@state, initial_state)
    end


    module Inspect
      def inspect
        "#<Trailblazer::Activity: {#{name || self[:options][:name]}}>"
      end

      alias_method :to_s, :inspect
    end


    require "trailblazer/activity/dsl/helper"
    # Helpers such as Path, Output, End to be included into {Activity}.
    module DSLHelper
      extend Forwardable
      def_delegators :@builder, :Path
      def_delegators DSL::Helper, :Output, :End, :Subprocess, :Track

      def Path(*args, &block)
        self[:builder].Path(*args, &block)
      end
    end

    module Accessor
      def []=(*args)
        @state = State::Config.send(:[]=, @state, *args)
      end

      def [](*args)
        State::Config[@state, *args]
      end
    end

    # FIXME: still to be decided
    # By including those modules, we create instance methods.
    # Later, this module is `extended` in Path, Railway and FastTrack, and
    # imports the DSL methods as class methods.
    module PublicAPI
      include Accessor

    require "trailblazer/activity/dsl/add_task"
      include DSL::AddTask

    require "trailblazer/activity/interface"
      include Activity::Interface # DISCUSS

      include DSLHelper # DISCUSS

      include Activity::Inspect # DISCUSS

    require "trailblazer/activity/dsl/magnetic/merge"
      include Magnetic::Merge # Activity#merge!

      def call(args, argumenter: [], **circuit_options) # DISCUSS: the argumenter logic might be moved out.
        _, args, circuit_options = argumenter.inject( [self, args, circuit_options] ) { |memo, argumenter| argumenter.(*memo) }

        self[:circuit].( args, circuit_options.merge(argumenter: argumenter) )
      end
    end
  end # Activity
end

require "trailblazer/circuit"
require "trailblazer/activity/structures"
require "trailblazer/activity/config"

require "trailblazer/activity/dsl/strategy/build_state"
require "trailblazer/activity/dsl/strategy/path"
require "trailblazer/activity/dsl/strategy/plan"
require "trailblazer/activity/dsl/strategy/railway"
require "trailblazer/activity/dsl/strategy/fast_track"

require "trailblazer/activity/task_wrap"
require "trailblazer/activity/task_wrap/call_task"
require "trailblazer/activity/task_wrap/trace"
require "trailblazer/activity/task_wrap/runner"
require "trailblazer/activity/task_wrap/merge"

require "trailblazer/activity/trace"
require "trailblazer/activity/present"

require "trailblazer/activity/introspect"

require "trailblazer/activity/dsl/magnetic/builder/state"
require "trailblazer/activity/dsl/magnetic" # the "magnetic" DSL

require "trailblazer/activity/dsl/schema/sequence"
require "trailblazer/activity/dsl/schema/dependencies"

require "trailblazer/activity/dsl/magnetic/builder/normalizer" # DISCUSS: name and location are odd. This one uses Activity ;)

require "trailblazer/activity/dsl/record"
