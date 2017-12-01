module DeviseForUser
  extend ActiveSupport::Concern

  def active_for_authentication?
    super && enabled?
  end


  def inactive_message
    enabled? ? super : User.human_attribute_name('disabled')
  end


  def disabled?
    !enabled?
  end


  def send_reset_password_instructions_notification(token)
    super if enabled?
  end

end
