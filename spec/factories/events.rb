FactoryGirl.define do
  factory :event do
    event_type
    venue
    tour
    user
    name { Faker::Company.name }
    date { Time.zone.today }
  end
end
