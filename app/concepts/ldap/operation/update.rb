# frozen_string_literal: true

class LDAP::Update < Trailblazer::Operation
  step :update!

  def update!(options, params:, **)
    name   = params[:name]
    emails = params[:emails]

    dn = "cn=#{name}, ou=Customers, dc=fraudbuster, dc=mobi"

    ops = [
      [:replace, :mail, emails],
    ]

    instance = LDAPConnector.instance
    instance.update(dn, ops)

    Rails.logger.warn instance.get_operation_result.message if instance.get_operation_result.code !=0

    true
  end
end
