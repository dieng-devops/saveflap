module DatatableHelper
  extend ActiveSupport::Concern

  included do
    def_delegators :@view, :link_to, :mail_to
    def_delegators :@view, :l, :ll, :t
    def_delegators :@view, :current_user
    def_delegators :@view, :content_tag, :image_tag, :check_box_tag, :icon, :bool_to_icon
    def_delegators :@view, :label_with_primary_tag, :label_with_info_tag, :label_with_warning_tag, :label_with_tag
    def_delegators :@view, :policy, :policy_scope
  end


  def selected
    @selected ||= (options[:selected] || [])
  end


  def from_selection
    @from_selection ||= (options[:from_selection] || [])
  end


  private


    def record_check_box(record, opts = {})
      check_box_tag('ids[]', record.id, selected.include?(record.id), opts)
    end

end
