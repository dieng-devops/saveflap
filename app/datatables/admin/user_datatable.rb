# frozen_string_literal: true

module Admin
  class UserDatatable < AjaxDatatablesRails::Base

    include DatatableFilters


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


    def data
      records.map do |record|
        {
          first_name:      record.decorate.link_to,
          email:           record.decorate.email,
          admin:           record.decorate.admin?,
          last_sign_in_at: record.decorate.connection_status,
          actions:         record.decorate.dt_actions,
          enabled:         record.decorate.enabled?,
          DT_RowId:        record.id,
        }
      end
    end


    def additional_datas
      {
        yadcf_data_2: select_options_for_boolean,
        yadcf_data_5: select_options_for_user_enabled_status,
      }
    end


    def get_raw_records
      User.send(*filter_on_active(column_filter: '5'))
    end

  end
end
