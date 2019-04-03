FactoryGirl.define do
  factory :event_type do
    event_department
    name { Faker::Company.name }
  end
end
