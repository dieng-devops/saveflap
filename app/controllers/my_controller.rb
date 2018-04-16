# frozen_string_literal: true

class MyController < ApplicationController

  responders :flash
  respond_to :html


  def account
    if request.get?
      run Users::Update::Present
    else
      run Users::Update do |result|
        reload_user_locales if result[:model].id == current_user.id
        return respond_with result[:model], location: -> { my_account_path }
      end
    end
  end

end
