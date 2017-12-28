require 'rails_helper'

describe LDAPConnector do

  let(:valid_instance) {
    LDAPConnector.new({
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
  }

  def create_item
    opts = {
      cn:   'foo@external.fraudbuster.mobi',
      sn:   'foo@external.fraudbuster.mobi',
      mail: ['foo@foo.com'],
      objectclass: ['top', 'inetOrgPerson'],
    }
    valid_instance.create('cn=foo@external.fraudbuster.mobi,ou=Customers,dc=fraudbuster,dc=mobi', opts)
  end


  def delete_item(cn = 'foo@external.fraudbuster.mobi')
    valid_instance.delete("cn=#{cn},ou=Customers,dc=fraudbuster,dc=mobi")
  end


  describe '#test_connection!' do
    context 'when LDAP dont responds' do
      it 'should raise an exception' do
        expect {
          LDAPConnector.new({}).test_connection!
        }.to raise_error(Net::LDAP::Error)
      end
    end

    context 'when LDAP server responds' do
      it 'should not raise an exception' do
        expect {
          valid_instance.test_connection!
        }.to_not raise_error
      end
    end
  end

  describe '#create' do
    it 'should add entry' do
      entry = create_item
      expect(entry).to be true
    end

    after { delete_item }
  end

  describe '#delete' do
    before { create_item }

    it 'should delete entry' do
      entry = delete_item
      expect(entry).to be true
    end
  end

  describe '#update' do
    before { create_item }

    it 'should update entry' do
      dn = 'foo@external.fraudbuster.mobi'
      entry = valid_instance.find(dn, 'dc=fraudbuster, dc=mobi')
      expect(entry).to be_a Net::LDAP::Entry
      expect(entry.mail).to eq ['foo@foo.com']

      ops = [
        [:replace, :mail, ['bar@bar.com']],
      ]

      result = valid_instance.update('cn=foo@external.fraudbuster.mobi,ou=Customers,dc=fraudbuster,dc=mobi', ops)
      expect(result).to be true

      entry = valid_instance.find(dn, 'dc=fraudbuster, dc=mobi')
      expect(entry.mail).to eq ['bar@bar.com']
    end

    after { delete_item }
  end

  describe '#find' do
    context 'when LDAP entry exists' do
      before { create_item }

      it 'should return entry' do
        entry = valid_instance.find('liste1@external.fraudbuster.mobi', 'dc=fraudbuster, dc=mobi')
        expect(entry).to be_a Net::LDAP::Entry
        expect(entry.dn).to eq 'cn=liste1@external.fraudbuster.mobi,ou=Customers,dc=fraudbuster,dc=mobi'
      end

      after { delete_item }
    end

    context 'when LDAP entry dont exists' do
      it 'should return entry' do
        entry = valid_instance.find('foo@external.fraudbuster.mobi', 'dc=fraudbuster, dc=mobi')
        expect(entry).to be nil
      end
    end
  end

  describe '#rename' do
    before { create_item }

    it 'should update entry' do
      entry = valid_instance.rename('cn=foo@external.fraudbuster.mobi,ou=Customers,dc=fraudbuster,dc=mobi', 'cn=bar@external.fraudbuster.mobi')
      expect(entry).to be true
      entry = valid_instance.find('bar@external.fraudbuster.mobi', 'dc=fraudbuster, dc=mobi')
      expect(entry).to be_a Net::LDAP::Entry
    end

    after { delete_item('bar@external.fraudbuster.mobi') }
  end
end
