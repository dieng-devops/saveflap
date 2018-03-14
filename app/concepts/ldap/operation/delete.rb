# frozen_string_literal: true

class LDAP::Delete < Trailblazer::Operation
  step :delete!

  def delete!(_options, params:, **)
    email = params[:email]

    dn = "cn=#{email}, ou=Customers, dc=fraudbuster, dc=mobi"

    instance = LDAPConnector.instance
    instance.delete(dn)
  end
end
