FactoryBot.define do

  factory :email do |f|
    f.mailing_list_id { create(:mailing_list).id }
    f.first_name      { Faker::Name.first_name }
    f.last_name       { Faker::Name.last_name }
    f.email           { Faker::Internet.email }
  end

end
