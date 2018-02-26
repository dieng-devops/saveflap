# frozen_string_literal: true

AjaxDatatablesRails.configure do |config|
  config.db_adapter = :mysql2 if Settings.db_adapter == 'mysql2'
end
