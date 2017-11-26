class MyController < ApplicationController

  responders :flash
  respond_to :html


  def account(options = {})
    if request.get?
      run User::Update::Present
    else
      run User::Update do |result|
        return respond_with result['model'], location: -> { my_account_path }
      end
    end
  end

end
