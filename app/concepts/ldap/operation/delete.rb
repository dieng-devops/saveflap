class LDAP::Delete < Trailblazer::Operation
  step :delete!

  def delete!(options, params:, **)
    name   = params[:name]

    dn = "cn=#{name}, ou=Customers, dc=fraudbuster, dc=mobi"

    instance = LDAPConnector.instance
    instance.delete(dn)
  end
end
