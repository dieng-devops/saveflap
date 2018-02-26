# frozen_string_literal: true

module Common
  module DataTablesHelper

    DATATABLE_LENGTH_MENU = [5, 10, 25, 50, 100].freeze

    def datatables_translations
      {
        processing:     t('datatables.processing'),
        search:         t('datatables.search'),
        lengthMenu:     t('datatables.lengthMenu'),
        info:           t('datatables.info'),
        infoEmpty:      t('datatables.infoEmpty'),
        infoFiltered:   t('datatables.infoFiltered'),
        infoPostFix:    t('datatables.infoPostFix'),
        loadingRecords: t('datatables.loadingRecords'),
        zeroRecords:    t('datatables.zeroRecords'),
        emptyTable:     t('datatables.emptyTable'),
        paginate: {
          first:    t('datatables.paginate.first'),
          previous: t('datatables.paginate.previous'),
          next:     t('datatables.paginate.next'),
          last:     t('datatables.paginate.last'),
        },
        aria: {
          sortAscending:  t('datatables.aria.sortAscending'),
          sortDescending: t('datatables.aria.sortDescending'),
        },
        select: {
          rows: t('datatables.select.rows')
        },
        buttons: {
          pageLength: {
            :_    => t('datatables.buttons.pageLength._'),
            :'-1' => t('datatables.buttons.pageLength.-1'),
          }
        }
      }
    end


    def datatable_default_options
      {
        processing:   true,
        serverSide:   true,
        stateSave:    true,
        responsive:   true,
        pageLength:   10,
        lengthMenu:   [[10, 25, 50, 100], [10, 25, 50, 100]],
        pagingType:   'simple_numbers',
        dom:          'lfrtip',
        order:        [],
        language:     datatables_translations,
      }
    end


    def datatables_for(id, opts: {}, html_opts: {}, &block)
      datatable = DataTablePresenter.new(self, id, opts: opts, html_opts: html_opts)
      yield datatable if block_given?
      datatable
    end


    DATATABLE_BUTTONS = {
      email: {
        label: 'datatables.buttons.email',
        icon: 'envelope-o',
        opts: { action: 'email' }
      },
      reset_selection: {
        label: 'datatables.buttons.reset_selection',
        icon: 'check-square-o',
        opts: { action: 'reset_selection', method: 'post' }
      },
      reset_filters: {
        label: 'datatables.buttons.reset_filters',
        icon: 'refresh',
        opts: { action: 'reset_filters' }
      },
      csv: {
        label: 'datatables.buttons.csv',
        icon: 'file-text-o',
        opts: { extend: 'csv' }
      },
      excel: {
        label: 'datatables.buttons.excel',
        icon: 'file-excel-o',
        opts: { extend: 'excel' }
      },
      pdf: {
        label: 'datatables.buttons.pdf',
        icon: 'file-pdf-o',
        opts: { extend: 'pdf' }
      },
      print: {
        label: 'datatables.buttons.print',
        icon: 'print',
        opts: { extend: 'print' }
      }
    }.freeze


    def datatable_button_for(button)
      button = button.to_sym
      label  = DATATABLE_BUTTONS[button][:label]
      icone  = DATATABLE_BUTTONS[button][:icon]
      opts   = DATATABLE_BUTTONS[button][:opts]
      opts.merge(text: icon(icone), titleAttr: t(label))
    end


    def bootstrap_datatables_for(name, opts = {}, &block)
      css_opts  = { width: '100%', class: 'table table-striped table-bordered display responsive no-wrap' }
      html_opts = opts.delete(:html_opts) { {} }
      html_opts = html_opts.merge(css_opts)
      datatables_for(name, opts: opts, html_opts: html_opts, &block)
    end


    def datatable_dom_with_selected_and_buttons(css_class = nil)
      "<\"html5buttons\"B>#{datatable_dom_with_selected(css_class)}"
    end


    def datatable_dom_with_selected(css_class = nil)
      "lr<\"clearfix\"><\"dataTables_info selected-count-wrapper #{css_class}\"<\".selected-count\">><\"#{css_class}\" i>tp"
    end


    def datatable_length_menu
      [DATATABLE_LENGTH_MENU, DATATABLE_LENGTH_MENU]
    end


    def datatable_options_for_range_date
      {
        filter_default_label: [label_filter_by('date_start', false), label_filter_by('date_end', false)],
        date_format: 'dd/mm/yyyy',
        datepicker_type: 'jquery-ui',
        filter_plugin_options: { changeMonth: true, changeYear: true }
      }
    end


    def label_filter_by(label, prefix = true)
      label  = t("datatables.filter.#{label}")
      label  = prefix ? label.downcase : label
      prefix = prefix ? "#{t('text.filter_by')} " : ''
      "#{prefix}#{label}"
    end

  end
end
