FactoryGirl.define do
  factory :town do
    country
    name { Faker::Address.city }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
