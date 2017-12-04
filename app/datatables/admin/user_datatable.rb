module Admin
  class UserDatatable < AjaxDatatablesRails::Base

    include DatatableHelper
    include DatatableFilters

    def_delegators :@view, :edit_admin_user_path, :admin_user_path


    def view_columns
      @view_columns ||= {
        first_name:      { source: 'User.first_name' },
        email:           { source: 'User.email' },
        admin:           { source: 'User.admin', cond: :eq },
        last_sign_in_at: { source: 'User.last_sign_in_at' },
        actions:         { source: 'User.id', searchable: false },
        enabled:         { source: 'User.enabled', cond: :eq },
      }
    end


    # rubocop:disable Metrics/MethodLength
    def data
      records.map do |record|
        {
          first_name:      link_to(record.full_name, edit_admin_user_path(record)),
          email:           mail_to(record.email),
          admin:           bool_to_icon(record.admin?),
          last_sign_in_at: render_connection_status(record),
          actions:         render_record_actions(record),
          enabled:         record.enabled?,
          'DT_RowId' => record.id,
        }
      end
    end
    # rubocop:enable Metrics/MethodLength


    def additional_datas
      {
        yadcf_data_2: select_options_for_boolean,
        yadcf_data_5: select_options_for_user_enabled_status,
      }
    end


    private


      def get_raw_records
        User.send(*filter_on_active(column_filter: '5'))
      end


      def render_connection_status(record)
        if record.currently_logged_in?
          label = icon('check', ::User.human_attribute_name('connected'))
          label_with_primary_tag(label)
        else
          ll(record.last_sign_in_at, default: ::User.human_attribute_name('never_connected'))
        end
      end


      def render_record_actions(record)
        record.super_admin? ? '' : link_to(icon('trash-o', t('text.delete')), admin_user_path(record), remote: true, method: :delete, data: { confirm: t('text.are_you_sure') })
      end

  end
end
