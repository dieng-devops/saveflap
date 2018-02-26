# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Set up gems listed in the Gemfile.
require 'bundler/setup'

# Speedup application loading (https://github.com/Shopify/bootsnap)
# require 'bootsnap/setup'
