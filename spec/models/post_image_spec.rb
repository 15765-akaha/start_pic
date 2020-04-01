require 'rails_helper'

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
        it "説明(caption)は100文字以内でない場合、投稿できない" do
            @post_image.caption = Faker::Lorem.characters(number:101)
            expect(@post_image).to_not be_valid
        end
        it "画像ファイルではない場合投稿できない"
        it "テーマが選ばれていない場合、投稿できない"
        it "ユーザーIDがなければ投稿できない"
    end


end
