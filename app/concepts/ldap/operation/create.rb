# frozen_string_literal: true

class LDAP::Create < Trailblazer::Operation
  step :create!

  # rubocop:disable Metrics/MethodLength
  def create!(_options, params:, **)
    email  = params[:email]
    emails = params[:emails]

    dn = "cn=#{email}, ou=Customers, dc=fraudbuster, dc=mobi"

    opts = {
      cn:   email,
      sn:   email,
      mail: emails,
      objectclass: %w[top inetOrgPerson],
    }

    instance = LDAPConnector.instance
    instance.create(dn, opts)

    Rails.logger.warn instance.get_operation_result.message if instance.get_operation_result.code != 0

    true
  end
  # rubocop:enable Metrics/MethodLength
end
