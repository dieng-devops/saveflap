# frozen_string_literal: true

module Common
  module LocalesHelper

    def available_locales
      I18n.available_locales.map{ |l| [t("language.name.#{l}"), l] }
    end

  end
end
