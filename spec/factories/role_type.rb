FactoryGirl.define do
  factory :role_type do
    name { Faker::Company.name }
    description { Faker::Hacker.say_something_smart }
  end
end
