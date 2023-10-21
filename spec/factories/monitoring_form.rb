FactoryBot.define do
  factory :monitoring_form do
    fact {Faker::Lorem.sentence}
    mind {Faker::Lorem.sentence}
    feel {Faker::Lorem.sentence}
    body {Faker::Lorem.sentence}
    behavior {Faker::Lorem.sentence}
    tag_name {Faker::Lorem.sentence}
  end
end
