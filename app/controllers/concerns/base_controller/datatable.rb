# frozen_string_literal: true

module BaseController
  module Datatable
    extend ActiveSupport::Concern

    included do
      class_attribute :datatable_class

      class << self
        def set_datatable_class(klass)
          self.datatable_class = klass
        end
      end
    end


    def datatable
      set_data_in_session(:selected, get_selected_ids)
      render json: new_datatable_instance
    end


    def reset_selected
      set_data_in_session(:selected, []) if request.post?
      render json: true
    end


    private


      def new_datatable_instance
        datatable_class.constantize.new(view_context, datatable_params)
      end


      def datatable_params
        { selected: get_data_in_session(:selected) }
      end


      def get_selected_ids(scope = session_scope)
        data = get_data_in_session(:selected, scope) || []
        data = data.concat(params[:selected].map(&:to_i)) if params[:selected]
        data = data - params[:not_selected].map(&:to_i) if params[:not_selected]
        data.uniq.sort
      end


      def compute_session_scope(klass)
        klass.gsub('Datatable', '').underscore.downcase.pluralize.to_sym
      end

  end
end
