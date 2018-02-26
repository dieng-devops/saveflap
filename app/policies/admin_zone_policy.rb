# frozen_string_literal: true

class AdminZonePolicy < Struct.new(:user, :admin_zone)
  include PolicyHelper
end
