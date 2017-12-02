class User < ApplicationRecord

  # Devise stuff (put it first as we may override some methods)
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Patch Devise for User
  include DeviseForUser

  # Scopes
  scope :order_by_full_name, -> { order({ first_name: :asc, last_name: :asc }) }

  scope :admin,     -> { where(admin: true) }
  scope :non_admin, -> { where(admin: false) }

  scope :active, -> { where(enabled: true) }
  scope :locked, -> { where(enabled: false) }


  def to_s
    full_name
  end


  def full_name
    "#{first_name} #{last_name}"
  end


  def super_admin?
    id == 1
  end

end
