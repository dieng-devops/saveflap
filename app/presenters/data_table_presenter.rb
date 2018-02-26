# frozen_string_literal: true

class DataTablePresenter < SimpleDelegator

  attr_reader :dt_id, :column_names

  def initialize(view, id, opts: {}, html_opts: {})
    super(view)
    @view           = view
    @dt_id          = id
    @datatable_id   = "#{@dt_id}-datatable"
    @opts           = opts
    @js_method      = 'createDatatable'
    @columns        = []
    @column_names   = []
    @buttons        = []
    @body_opts      = {}
    @search_fields  = []
    @escape_strings = []
    @html_opts      = html_opts
  end


  def head_for(column, opts = {})
    @column_names << column
    @columns << DataColumn.new(@view, column, opts)
  end


  def body(opts = {})
    @body_opts = opts
  end


  def button(opts = {})
    @buttons << opts
  end


  def js_method(js_method)
    @js_method = js_method
  end


  def render_datatable
    options = @html_opts.deep_merge(id: datatable_id, data: { server_side: true })
    content_tag(:table, table_content, options)
  end


  def render_js_datatable
    raw("
    var #{datatable_id.underscore}_options       = #{render_json(datatable_options)};
    var #{datatable_id.underscore}_search_fields = #{search_fields};
    #{@js_method}('##{datatable_id}', #{datatable_id.underscore}_options, #{datatable_id.underscore}_search_fields);
    ")
  end


  def search_form(options = {}, &block)
    options.reverse_merge!({ builder: SearchFormBuilder })
    options[:html] ||= {}
    options[:html][:role] ||= 'form'
    options[:acts_like_form_tag] = true
    options[:datatable] = self

    layout = case options[:layout]
      when :inline
        "form-inline"
      when :horizontal
        "form-horizontal"
    end

    if layout
      options[:html][:class] = [options[:html][:class], layout].compact.join(" ")
    end

    form_for('', options, &block)
  end


  def search_field(field)
    @search_fields << field
  end


  private

    attr_reader :datatable_id


    def table_content
      table_headers + table_body
    end


    def table_body
      content_tag(:tbody, '', @body_opts)
    end


    def table_headers
      content_tag(:thead, table_row)
    end


    def table_row
      content_tag(:tr, @columns.map(&:to_s).join.html_safe)
    end


    def search_fields
      render_json @search_fields
    end


    def datatable_columns
      @columns.map(&:to_hash)
    end


    def datatable_options
      opts = datatable_default_options.dup
      opts = opts.merge(columns: datatable_columns, buttons: @buttons).merge(@opts)
      opts
    end


    def render_json(object)
      if Rails.env.development?
        JSON.neat_generate(object, wrap: 40, aligned: true, around_colon: 1)
      else
        object.to_json
      end
    end


end
