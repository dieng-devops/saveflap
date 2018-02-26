# frozen_string_literal: true

module NavigationHelper

  def render_navigation_menu(context)
    options = bootstrap_menu_options.merge(context: context)
    render_navigation(options)
  end


  def bootstrap_menu_options
    { renderer: :bootstrap3, expand_all: true, remove_navigation_class: true, skip_if_empty: true }
  end


  def menu_entry_for_model(model, opts = {})
    [{ icon: icon_for_entry(model.constantize.model_icon_name), text: label_for_entry(get_model_name_for(model)) }, url_for_entry(model, opts)]
  end


  def icon_for_entry(icon)
    "fa #{icon}"
  end


  def label_for_entry(label)
    content_tag(:span, label, class: 'nav-label')
  end


  def url_for_entry(model, opts = {})
    klass = model.constantize
    namespace = opts.delete(:namespace) { nil }
    url_for([namespace, klass.new].compact)
  end


  def menu_divider
    ['', '#', html: { divider: true, class: 'divider-horizontal' }, highlights_on: %r(//)]
  end

end
