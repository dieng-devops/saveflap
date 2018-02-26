# frozen_string_literal: true

require 'securerandom'

module Flap
  module Utils
    module Crypto
      module_function

      def generate_secret(length)
        length = length.to_i
        secret = SecureRandom.base64(length * 2)
        secret = secret.gsub(/[\=\_\-\+\/]/, '')
        secret = secret.split(//).sample(length).join('')
        secret
      end

    end
  end
end
