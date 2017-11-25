class User < ApplicationRecord

  # Devise stuff (put it first as we may override some methods)
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

end
