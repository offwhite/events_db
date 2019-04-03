FactoryGirl.define do
  factory :tour do
    tour_type
    user
    name { Faker::Company.name }
  end
end
