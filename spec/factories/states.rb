FactoryGirl.define do
  factory :state do
    iso { Faker::Address.country_code }
    name { Faker::Address.country }
    country
  end
end
