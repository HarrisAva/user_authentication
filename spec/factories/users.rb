FactoryBot.define do
  factory :user do
    username {Faker::Internet.username}
    password {"password"}
    password_confirmation {"password"}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
  end
end
