# frozen_string_literal: true

module Common
  module FlashHelper

    ALERT_MAPPING = {
      success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-danger',
      warning: 'alert-warning',
      info:    'alert-info',
      notice:  'alert-info'
    }.freeze


    def render_flashes
      messages = []
      flash.each do |key, value|
        css = ALERT_MAPPING[key.to_sym]
        content = button_close + value
        messages << content_tag(:div, content.html_safe, class: "alert #{css} fade in", role: 'alert')
      end

      messages = messages.map { |m| content_tag(:li, m) }
      messages = messages.join('').html_safe
      content_tag(:ul, messages, class: 'list-unstyled')
    end


    def button_close
      content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
        content_tag(:span, '&times;'.html_safe, 'aria-hidden' => 'true') +
        content_tag(:span, 'Close', class: 'sr-only')
      end
    end


    def render_flashes_as_js(target = '#flash-messages', opts = {})
      str = js_render(target, render_flashes, opts)
      str << "setAlertDismiss();\n"
      str.html_safe
    end

  end
end
