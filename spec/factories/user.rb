FactoryBot.define do

  factory :user do |f|
    f.first_name      { Faker::Name.first_name }
    f.last_name       { Faker::Name.last_name }
    f.email           { Faker::Internet.email }
    f.password        { Faker::Internet.password(6) }
    f.language        'fr'
    f.time_zone       'Paris'

    factory :admin do |f|
      f.admin true
    end
  end

end
