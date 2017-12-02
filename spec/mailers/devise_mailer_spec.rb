require 'rails_helper'

describe DeviseMailer do

  describe '#reset_password_instructions' do
    let(:user) { create_user }
    let(:mail) { described_class.reset_password_instructions(user, 'foofoo').deliver_now }

    it 'should have a subject' do
      expect(mail.subject).to eq 'Flap! :: Instructions pour changer de mot de passe'
    end

    it 'should have the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'should have the sender email' do
      expect(mail.from).to eq([Settings.mail_from])
    end

    it 'should contain valid message' do
      expect(mail.body.encoded).to match("Quelqu'un a demand=C3=A9 un lien pour changer votre mot de passe.")
    end
  end


  describe '#password_change' do
    let(:user) { create_user(password: 'foofoo', password_confirmation: 'foofoo') }
    let(:mail) { described_class.password_change(user, password: 'foofoo').deliver_now }

    it 'should have a subject' do
      expect(mail.subject).to eq 'Flap! :: Changement de mot de passe'
    end

    it 'should have the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'should have the sender email' do
      expect(mail.from).to eq([Settings.mail_from])
    end

    it 'should contain valid message' do
      expect(mail.body.encoded).to match("Votre mot de passe a =C3=A9t=C3=A9 chang=C3=A9, voici le nouveau : foofoo=")
    end
  end


  describe '#welcome' do
    let(:user) { create_user(password: 'foofoo', password_confirmation: 'foofoo') }
    let(:mail) { described_class.welcome(user, password: 'foofoo').deliver_now }

    it 'should have a subject' do
      expect(mail.subject).to eq 'Flap! :: Bienvenue !'
    end

    it 'should have the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'should have the sender email' do
      expect(mail.from).to eq([Settings.mail_from])
    end

    it 'should contain valid message' do
      expect(mail.body.encoded).to match("Votre compte a =C3=A9t=C3=A9 cr=C3=A9=C3=A9 sur la plateforme Flap!.")
      expect(mail.body.encoded).to match("Votre mot de passe est : foofoo")
    end
  end

end
