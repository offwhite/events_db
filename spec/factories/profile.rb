FactoryGirl.define do
  factory :profile do
    name { Faker::Name.name }
    biography { Faker::Company.name }
  end
end
