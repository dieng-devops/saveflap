# frozen_string_literal: true

module Common
  module IconsHelper

    def bool_to_icon(bool, opts = {})
      bool ? check_icon(opts) : cross_icon(opts)
    end


    def check_icon(opts = {})
      icon 'check', { class: 'fa-success' }.merge(opts)
    end


    def cross_icon(opts = {})
      icon 'times', { class: 'fa-important' }.merge(opts)
    end

  end
end
