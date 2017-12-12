FactoryBot.define do

  factory :email do |f|
    f.mailing_list_id { MailingLists::Create.(mailing_list: attributes_for(:mailing_list_tb))['model'].id }
    f.first_name      { Faker::Name.first_name }
    f.last_name       { Faker::Name.last_name }
    f.email           { Faker::Internet.email }
  end

end
