require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do

    describe "ユーザー情報が正しく保存されているか" do

      it "ニックネーム、メール、パスワードがある場合、有効である" do
        expect(build(:user)).to be_valid
      end
      it "ニックネームがない場合無効である" do
        expect(build(:user, name: nil)).to_not be_valid 
      end
      it "ニックネームは２文字以上でない場合無効である" do
        expect(build(:user, name: "t")).to_not be_valid 
      end
      it "ニックネームは20文字以下でない場合無効である" do
        expect(build(:user, name: "t" * 21)).to_not be_valid 
      end
      it "メールアドレスがない場合無効である" do
        expect(build(:user, email: nil)).to_not be_valid
      end
      it "重複したメールアドレスの場合、無効である" do
        user1 = create(:user)
        expect(build(:user, email: user1.email)).to_not be_valid
      end
      it "パスワードがない場合、無効である" do
        expect(build(:user, password: "")).to_not be_valid
      end

      it "password_confirmationとpasswordが異なる場合保存できない" do
        expect(build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
      end
      it "自己紹介は150文字以下でなければ保存できない" do
        expect(build(:user, introduction: Faker::Lorem.characters(number:151))).to_not be_valid
      end
      it "achivementの初期値はBEGINNERである" do
        user = create(:user)
        expect(user.achivement).to eq "BEGINNER"
      end
    end
end
