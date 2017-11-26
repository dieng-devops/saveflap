module Authentication
  class PasswordsController < Devise::PasswordsController
    layout 'forgot_password'
  end
end
