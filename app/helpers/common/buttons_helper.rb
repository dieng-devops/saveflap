module Common
  module ButtonsHelper

    def options_for_spinner_button(label = t('text.save_in_progress'))
      { class: 'btn btn-outline btn-primary', data: { disable_with: spinner_icon(label) } }
    end


    def spinner_icon(label, icon = 'fa-spinner')
      "<i class='fa #{icon} fa-spin'></i> #{label}"
    end

  end
end
