class User < ApplicationRecord

  # Devise stuff (put it first as we may override some methods)
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Patch Devise for User
  include DeviseForUser


  def to_s
    "#{first_name} #{last_name}"
  end


  def super_admin?
    id == 1
  end

end
