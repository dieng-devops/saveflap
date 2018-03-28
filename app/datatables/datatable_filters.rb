# frozen_string_literal: true

module DatatableFilters
  extend ActiveSupport::Concern

  def selected
    @selected ||= (options[:selected] || [])
  end


  def from_selection
    @from_selection ||= (options[:from_selection] || [])
  end


  def filter_on_deleted(column_filter:)
    @filter_on_deleted ||= check_deleted_filter(column_filter)
  end


  def filter_on_active(column_filter:)
    @filter_on_active ||= check_active_filter(column_filter)
  end


  def filter_on_column?(column_filter:)
    value = params.dig('columns', column_filter, 'search', 'value')
    value.present?
  end


  private


    def check_deleted_filter(column)
      value = params.dig('columns', column, 'search', 'value')
      case value
      when 'deleted'
        [:deleted]
      when 'active'
        [:not_deleted]
      when 'active|deleted', 'deleted|active'
        [:where, 'deleted_at IS NULL OR deleted_at IS NOT NULL']
      else
        [:not_deleted]
      end
    end


    def check_active_filter(column)
      value = params.dig('columns', column, 'search', 'value')
      value == '0' ? [:locked] : [:active]
    end


    def select_options_for_deleted_state
      [
        { value: 'active', label: I18n.t('text.state.active') },
        { value: 'deleted', label: I18n.t('text.state.deleted') },
      ]
    end


    def select_options_for_boolean
      [
        { value: 1, label: I18n.t('text.yes') },
        { value: 0, label: I18n.t('text.no') },
      ]
    end


    def select_options_for_user_enabled_status
      [
        { value: 1, label: I18n.t('text.state.active') },
        { value: 0, label: I18n.t('text.state.locked') },
      ]
    end


    def create_array(klass, sort_method = :order_by_name, value_method = :id, label_method = :to_s)
      klass.send(sort_method).map { |object| { value: object.send(value_method), label: object.send(label_method) } }
    end

end
