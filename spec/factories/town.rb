FactoryGirl.define do
  factory :town do
    country
    state
    name { Faker::Address.city }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
