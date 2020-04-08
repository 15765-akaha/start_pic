FactoryBot.define do
  factory :post_image do
    caption { Faker::Lorem.characters(number:20) }
  end
end
