# frozen_string_literal: true

class LDAP::Rename < Trailblazer::Operation
  step :rename!

  def rename!(_options, params:, **)
    old_email = params[:old_email]
    new_email = params[:new_email]

    old_dn = "cn=#{old_email}, ou=Customers, dc=fraudbuster, dc=mobi"
    new_dn = "cn=#{new_email}"

    instance = LDAPConnector.instance
    instance.rename(old_dn, new_dn)

    Rails.logger.warn instance.get_operation_result.message if instance.get_operation_result.code != 0

    true
  end
end
