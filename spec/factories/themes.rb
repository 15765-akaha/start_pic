FactoryBot.define do
  factory :theme do
    title { Faker::Lorem.characters(number:5)}
  end
end
