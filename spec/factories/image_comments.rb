FactoryBot.define do
  factory :image_comment do
    comment { Faker::Lorem.characters(number:20) }
  end
end
