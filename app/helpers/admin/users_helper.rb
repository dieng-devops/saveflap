module Admin
  module UsersHelper

    def user_password_options
      [
        ['generate', ::User.human_attribute_name('generate_password')],
        ['manual',   ::User.human_attribute_name('specify_password')],
      ]
    end

  end
end
