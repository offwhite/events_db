FactoryGirl.define do
  factory :tour_type, class: EventType do
    name { Faker::Company.name }
  end
end
