FactoryBot.define do
  factory :user do
    name                    {'山田太郎'}
    nickname                {'nick'}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
  end
end
