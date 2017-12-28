class LDAP::Create < Trailblazer::Operation
  step :create!

  def create!(options, params:, **)
    name   = params[:name]
    emails = params[:emails]

    dn = "cn=#{name}, ou=Customers, dc=fraudbuster, dc=mobi"

    opts = {
      cn:   name,
      sn:   name,
      mail: emails,
      objectclass: ['top', 'inetOrgPerson'],
    }

    instance = LDAPConnector.instance
    instance.create(dn, opts)

    Rails.logger.warn instance.get_operation_result.message if instance.get_operation_result.code !=0

    true
  end
end
