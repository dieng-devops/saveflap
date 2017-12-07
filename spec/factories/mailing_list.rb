FactoryBot.define do

  factory :mailing_list do |f|
    f.name { Faker::Name.first_name }
  end

end
