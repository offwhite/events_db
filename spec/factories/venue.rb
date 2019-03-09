FactoryGirl.define do
  factory :venue do
    town
    name { Faker::Company.name }
    description { Faker::Hacker.adjective }
    address { Faker::Address.street_address }
    capacity { 3000 }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
