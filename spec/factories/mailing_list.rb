FactoryBot.define do

  factory :mailing_list do |f|
    f.name  { Faker::Name.name }
    f.email { Faker::Internet.email }

    factory :mailing_list_tb do |f|
      f.emails_attributes { { '0' => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email } } }
    end
  end

end
