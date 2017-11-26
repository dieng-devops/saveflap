module Authentication
  class SessionsController < Devise::SessionsController
    layout 'login'
  end
end
