# frozen_string_literal: true

class UserDecorator < ApplicationDecorator

  #############
  # DB Fields #
  #############

  DELEGATED_FIELDS = %i[
    first_name last_name
  ].freeze

  delegate(*DELEGATED_FIELDS)

  def to_s
    full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def email
    h.mail_to object.email
  end

  def admin?
    h.bool_to_icon object.admin?
  end

  def enabled?
    h.bool_to_icon object.enabled?
  end

  ###########
  # Helpers #
  ###########

  def link_to
    h.link_to full_name, h.edit_admin_user_path(object)
  end

  def dt_actions
    return '' if object.super_admin?
    h.link_to h.icon('trash-o', h.t('text.delete')), h.admin_user_path(object), remote: true, method: :delete, data: { confirm: h.t('text.are_you_sure') }
  end

  def connection_status
    if object.currently_logged_in?
      label = h.icon('check', User.human_attribute_name('connected'))
      h.label_with_primary_tag(label)
    else
      h.ll(object.last_sign_in_at, default: User.human_attribute_name('never_connected'))
    end
  end

end
