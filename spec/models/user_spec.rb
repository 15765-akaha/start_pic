require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do

    describe "ユーザーが正しく保存できているか" do

      it "ニックネーム、メール、パスワードがある場合、有効である" do
        # userのそれぞれのカラムに対して値を入れてオブジェクト化する
        expect(FactoryBot.create(:user)).to be_valid
      end
      it "ニックネームがない場合無効である" do
        expect(FactoryBot.build(:user, name: nil)).to_not be_valid 
      end
      it "ニックネームは２文字以上である" do
        expect(FactoryBot.build(:user, name: "t")).to_not be_valid 
      end
      it "ニックネームは20文字以下である" do
        expect(FactoryBot.build(:user, name: "testtesttesttesttestt")).to_not be_valid 
      end
      it "メールアドレスがない場合無効である" do
        expect(FactoryBot.build(:user, email: nil)).to_not be_valid
      end
      it "重複したメールアドレスの場合、無効である" do
        user1 = FactoryBot.create(:user,name: "test", email: "test@example.com")
        expect(FactoryBot.build(:user, name: "test2", email: user1.email)).to_not be_valid
      end
      it "パスワードがない場合、無効である" do
        expect(FactoryBot.build(:user, password: "")).to_not be_valid
      end

      it "password_confirmationとpasswordが異なる場合保存できない" do
        expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
      end
    end
end
