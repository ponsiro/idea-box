FactoryBot.define do
  factory :idea do
    content           {'初めましてこういうアイディアがあります。どうでしょうか。'}
    association :user

    after(:build) do |idea|
      idea.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
