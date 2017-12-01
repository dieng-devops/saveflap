module ApplicationHelper

  ALERT_MAPPING = {
    success: 'alert-success',
    error:   'alert-danger',
    alert:   'alert-danger',
    warning: 'alert-warning',
    info:    'alert-info',
    notice:  'alert-info'
  }.freeze


  def options_for_spinner_button(label = t('text.save_in_progress'))
    { class: 'btn btn-outline btn-primary', data: { disable_with: spinner_icon(label) } }
  end


  def spinner_icon(label, icon = 'fa-spinner')
    "<i class='fa #{icon} fa-spin'></i> #{label}"
  end


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


  def get_model_name_for(klass, pluralize: true)
    count = pluralize ? 2 : 1
    klass.constantize.model_name.human(count: count)
  end


  def available_locales
    I18n.available_locales.map{ |l| [t("language.name.#{l}"), l] }
  end


  def easy_form_for(object, opts = {}, &block)
    layout = request.xhr? ? :default : :horizontal
    opts   = opts.reverse_merge(remote: request.xhr?, layout: layout)
    bootstrap_form_for(object, opts, &block)
  end

end
