FactoryBot.define do
  factory :temptation do
    event {Faker::Lorem.sentence}
    talk {Faker::Lorem.sentence}
    cost {Faker::Lorem.sentence}
    get_out {Faker::Lorem.sentence}
    association :user
  end
end
