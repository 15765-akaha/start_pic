require 'rails_helper'

RSpec.describe "テーマモデルのテスト", type: :model do

  describe "テーマが正しく作成されているか" do

    context "管理者側が作成するパターン" do
      before do
        @theme = build(:theme)
        @theme.admin = true
      end

      it "タイトルが入力されているので作成できる" do
        expect(@theme).to be_valid
      end
      it "is_enabled（公開/非公開)がtrueで作成されている" do
        expect(@theme.is_enabled).to eq true
      end
      it "is_enabled(公開/非公開）がfalseでも作成できる" do
        @theme.is_enabled = false
        expect(@theme).to be_valid
      end
      it "adminフラグがtrueで作成されている" do
        expect(@theme.admin).to eq true
      end
      it "create_user_idがnillで作成されている" do
        expect(@theme.create_user_id).to eq nil
      end

      it "タイトルが入力されていないので作成できない" do
        @theme.title = nil
        expect(@theme).to_not be_valid
      end
      it "タイトルが重複しているため作成できない" do
        theme1 = create(:theme, admin: true)
        @theme.title = theme1.title
        expect(@theme).to_not be_valid
      end

    end

    context "ユーザーが作成するパターン" do
      before do
        @user = create(:user)
        @theme = build(:theme)
        @theme.create_user_id = @user.id
      end
      it "タイトルが入力されているので作成できる" do
        expect(@theme).to be_valid
      end

      it "タイトルが入力されていないので作成できない" do
        @theme.title = nil
        expect(@theme).to_not be_valid
      end
      it "タイトルが重複しているため作成できない" do
        theme1 = create(:theme, create_user_id:@user.id)
        @theme.title = theme1.title
        expect(@theme).to_not be_valid
      end

      it "adminフラグがfalseで作成されている" do
        expect(@theme.admin).to eq false
      end
      it "create_user_idに作成したuserのIDが保存されている" do
        expect(@theme.create_user_id).to eq @user.id
      end

      it "adminがfalseの状態でcreate_user_idがない場合は作成できない" do
        @theme.create_user_id = nil
        expect(@theme).to_not be_valid
      end
      it "userのachivementは CHALLENGER である" do
        @user.achivement = "CHALLENGER"
        expect(@theme.create_user_id).to eq @user.id
      end

      it "userのachivementは MASTER である" do
        @user.achivement = "MASTER"
        expect(@theme.create_user_id).to eq @user.id
      end
    end

  end
end
