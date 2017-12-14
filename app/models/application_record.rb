class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  VALID_EMAIL_REGEX = /\A(?<mail>[^@\s]+[^\.])@(?<domain>(?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  class << self

    def model_icon_name(opts = {})
      options = { count: 2, scope: 'activerecord.icons' }.merge(opts)
      I18n.t(self.name.underscore, options)
    end

  end

end
