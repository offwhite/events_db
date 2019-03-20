FactoryGirl.define do
  factory :profile do
    name { Faker::Name.name }
    username { Profile.count }
    biography { Faker::Company.name }
  end
end
