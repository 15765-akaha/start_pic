FactoryBot.define do
  factory :post_image do
    image_id { Rack::Test::UploadedFile.new( File.join( Rails.root, 'spec/fixtures/test.jpg' ) ) }
    caption { Faker::Lorem.characters(number:20) }
  end
end
