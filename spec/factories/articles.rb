FactoryBot.define do
  factory :article do
    title {Faker::Lorem.word}
    genre_id {Faker::Number.between(from: 1, to: 10)}
    text {Faker::Lorem.sentence}
    association :user 
  end
end
