FactoryGirl.define do
  factory :country do
    iso { Faker::Address.country_code }
    name { Faker::Address.country }
  end
end
