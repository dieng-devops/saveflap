# frozen_string_literal: true

class ::Logger::Formatter
  def call(severity, time, progname, msg)
    "#{msg}\n"
  end
end
