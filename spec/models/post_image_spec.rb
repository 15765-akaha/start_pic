require 'rails_helper'
require "refile/file_double"

RSpec.describe "投稿画像のテスト", type: :model do
    
    describe "画像が正しく投稿されるか" do
        before do
          @user = create(:user)
          @theme = create(:theme, admin:true)
          @post_image = build(:post_image, user_id: @user.id, theme_id: @theme.id)
        end
        it "画像、説明、テーマIDとユーザーIDがあるため投稿できる" do
            expect(@post_image).to be_valid
        end

        it "画像の場合のみ、ファイル挿入ができる" do
            @post_image.image = Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")
            @post_image.save
            expect(@post_image.image_id).to_not be_nil
        end

        it "画像ではない場合、ファイル挿入ができない(image_idがnilになる）" do
            @post_image.image = Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain")
            @post_image.save
            expect(@post_image.image_id).to be_nil
        end

        it "説明(caption)は100文字以内でない場合、投稿できない" do
            @post_image.caption = Faker::Lorem.characters(number:101)
            expect(@post_image).to_not be_valid
        end
        it "テーマが選ばれていない場合、投稿できない" do
            @post_image.theme_id = ""
            expect(@post_image).to_not be_valid
        end
        it "ユーザーIDがなければ投稿できない" do
            @post_image.user_id = ""
            expect(@post_image).to_not be_valid
        end
    end
end
