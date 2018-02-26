# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  language               :string(255)
#  time_zone              :string(255)
#  admin                  :boolean          default(FALSE)
#  enabled                :boolean          default(TRUE)
#  last_request_at        :datetime
#  logged_in              :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
