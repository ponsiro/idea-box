FactoryBot.define do
  factory :comment do
    text     {"初めまして"}
    association :user
    association :idea
  end
end
