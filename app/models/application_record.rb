class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self

    def model_icon_name(opts = {})
      options = { count: 2, scope: 'activerecord.icons' }.merge(opts)
      I18n.t(self.name.underscore, options)
    end

  end

end
