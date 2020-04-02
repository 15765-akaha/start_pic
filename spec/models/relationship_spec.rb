require 'rails_helper'

RSpec.describe "フォロー機能のテスト", type: :model do
  before do
    @follower_user = create(:user)
    @following_user = create(:user)
    @relationship = create(:relationship, following_id: @following_user.id, follower_id: @follower_user.id)
  end
    it "フォロー側とフォローされる側にユーザーが存在するとき作成できる" do
      expect(@relationship).to be_valid
    end
end
