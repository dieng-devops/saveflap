# frozen_string_literal: true

# Remove email dump from logs
ActionMailer::Base.logger = nil
