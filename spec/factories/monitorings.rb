FactoryBot.define do
  factory :monitoring do
    fact {Faker::Lorem.sentence}
    mind {Faker::Lorem.sentence}
    feel {Faker::Lorem.sentence}
    body {Faker::Lorem.sentence}
    behavior {Faker::Lorem.sentence}
    association :user
  end
end
