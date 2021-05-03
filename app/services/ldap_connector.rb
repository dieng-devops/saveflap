# frozen_string_literal: true

class LDAPConnector
  extend Forwardable

  def_delegators :@ldap, :get_operation_result

  attr_reader :ldap

  def initialize(opts = {})
    @opts = opts
    @ldap = ldap_connection
    puts @ldap.inspect
    puts "==================================="
  end


  class << self

    # rubocop:disable Metrics/MethodLength
    def instance
      return @instance if @instance
       @instance = new({
          host: Settings.ldap_host,
          port: Settings.ldap_port,
          base: 'ou=people,dc=fraudbuster,dc=mobi',
          encryption: {
            method: :simple_tls,
            tls_options: {
               ca_file: '/etc/ssl/certs/fraudbuster_wildcard.pem',
               ssl_version: 'TLSv1_1' }
          },
          auth: {
            method: :simple,
            username: Settings.ldap_user,
            password: Settings.ldap_pass,
          },
        })
    end
    # rubocop:enable Metrics/MethodLength

  end


  def test_connection!
    begin
      @ldap.bind
    rescue Net::LDAP::Error => e
      @connected = false
      raise e
    else
      @connected = true
    end
  end


  def find(dn, treebase)
    filter = Net::LDAP::Filter.eq('cn', dn)
    result = ldap.search(base: treebase, filter: filter)
    result.first
  end


  def create(dn, attributes)
    ldap.add(dn: dn, attributes: attributes)
  end


  def update(dn, ops = [])
    ldap.modify dn: dn, operations: ops
  end


  def delete(dn)
    ldap.delete dn: dn
  end


  def rename(old_dn, new_dn)
    ldap.rename(olddn: old_dn, newrdn: new_dn)
  end


  private


    def ldap_connection
      Net::LDAP.new(@opts)
    end

end
