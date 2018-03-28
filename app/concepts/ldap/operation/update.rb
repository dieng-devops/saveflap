# frozen_string_literal: true

class LDAP::Update < Trailblazer::Operation
  step :update!

  def update!(_options, params:, **)
    email       = params[:email]
    emails      = params[:emails]
    description = params[:description]

    dn = "cn=#{email}, ou=Customers, dc=fraudbuster, dc=mobi"

    ops = [
      [:replace, :mail, emails],
      [:replace, :description, description]
    ]

    instance = LDAPConnector.instance
    instance.update(dn, ops)

    Rails.logger.warn instance.get_operation_result.message if instance.get_operation_result.code != 0

    true
  end
end
