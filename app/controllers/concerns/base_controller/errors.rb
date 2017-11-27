module BaseController
  module Errors
    extend ActiveSupport::Concern

    def render_403(pundit_exception = nil)
      render_4xx_error(t('errors.not_authorized'), 403)
      return false
    end


    def render_404(pundit_exception = nil)
      render_4xx_error(t('errors.file_not_found'), 404)
      return false
    end


    # Renders an error response
    def render_4xx_error(message, status = 500)
      @message    = message
      @status     = status

      respond_to do |format|
        format.html { render template: 'common/error', status: @status }
        format.any { head @status }
      end
    end

  end
end
