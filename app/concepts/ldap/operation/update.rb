class LDAP::Update < Trailblazer::Operation
  step :update!

  def update!(options, params:, **)
    ldap = ldap_connection
    return false if !ldap.bind

    ldap.modify dn: params[:dn], operations: params[:ops]

    if ldap.get_operation_result.code !=0
      puts ldap.get_operation_result.message
      return false
    else
      return true
    end
  end


  private


  def ldap_connection
    Net::LDAP.new({
      host: Settings.ldap_host,
      port: Settings.ldap_port,
      encryption: {
        method: :start_tls
      },
      auth: {
        method: :simple,
        username: Settings.ldap_user,
        password: Settings.ldap_pass,
      }
    })
  end

end
