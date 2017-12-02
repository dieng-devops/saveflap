module ApplicationHelper

  def get_model_name_for(klass, pluralize: true)
    count = pluralize ? 2 : 1
    klass.constantize.model_name.human(count: count)
  end


  def easy_form_for(object, opts = {}, &block)
    layout = request.xhr? ? :default : :horizontal
    opts   = opts.reverse_merge(remote: request.xhr?, layout: layout)
    bootstrap_form_for(object, opts, &block)
  end


  def display_on_condition(test, condition)
    test == condition ? '' : 'display: none;'
  end

end
