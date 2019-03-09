FactoryGirl.define do
  factory :event_type do
    name { Faker::Company.name }
  end
end
