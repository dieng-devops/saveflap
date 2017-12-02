class SearchFormBuilder < BootstrapForm::FormBuilder

  def initialize(object_name, object, template, options)
    @datatable = options[:datatable]
    super
  end


  def search_field(name, opts = {}, container_opts = {})
    # Set container_id
    container_id = id_for_container(name)
    label = opts.delete(:filter_default_label) { @template.label_filter_by(name) }

    # Treat search field options
    column_id = @datatable.column_names.index(name)
    opts      = opts.merge(filter_container_id: container_id, filter_default_label: label, filter_type: 'text', column_number: column_id)

    # Treat container options
    container_opts = container_opts.merge(id: container_id)

    # Set search field
    @datatable.search_field(opts)
    content_tag(:div, '', container_opts)
  end


  def select(name, opts = {}, container_opts = {})
    opts = opts.deep_merge(filter_type: 'select')
    select_field(name, opts, container_opts)
  end


  def multi_select(name, opts = {}, container_opts = {})
    opts = opts.deep_merge(filter_type: 'multi_select', select_type_options: { width: 'element' })
    select_field(name, opts, container_opts)
  end


  def range_date(name, opts = {}, container_opts = {})
    # Set container_id
    container_id = id_for_container(name)
    label = opts.delete(:filter_default_label) { @template.label_filter_by(name) }

    # Treat search field options
    column_id = @datatable.column_names.index(name)
    opts      = opts.merge(filter_container_id: container_id, filter_default_label: label, filter_type: 'range_date', column_number: column_id)

    # Treat container options
    container_opts = container_opts.merge(id: container_id)

    # Set search field
    @datatable.search_field(opts)
    content_tag(:div, '', container_opts)
  end


  def render_datatable
    @datatable.render_datatable
  end


  def render_js_datatable
    @datatable.render_js_datatable
  end


  private


    def select_field(name, opts = {}, container_opts = {})
      # Set container_id
      container_id = id_for_container(name)
      label = opts.delete(:filter_default_label) { @template.label_filter_by(name) }

      # Treat search field options
      column_id = @datatable.column_names.index(name)
      opts      = opts.deep_merge(filter_container_id: container_id, filter_default_label: label, select_type: 'select2', column_number: column_id, select_type_options: { minimumResultsForSearch: '-1' })

      # Treat container options
      container_opts = container_opts.merge(id: container_id)

      # Set search field
      @datatable.search_field(opts)
      content_tag(:div, '', container_opts)
    end


    def id_for_container(name)
      "#{@datatable.dt_id}_#{name}_filter".dasherize
    end

end
