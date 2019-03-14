FactoryGirl.define do
  factory :creator, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
