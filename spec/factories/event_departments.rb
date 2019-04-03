FactoryGirl.define do
  factory :event_department do
    name { Faker::Company.name }
    description { Faker::Hacker.say_something_smart }
  end
end
