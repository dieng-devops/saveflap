module DeviseHelper

  # Define Devise registration_path ourselves because
  # registration moddule is disabled
  def registration_path(*)
    user_registration_path
  end

end
