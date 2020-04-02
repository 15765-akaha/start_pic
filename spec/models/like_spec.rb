require 'rails_helper'

RSpec.describe "いいねのテスト", type: :model do
  before do
    @posted_user = create(:user)
    @user = create(:user)
    @theme = create(:theme, admin:true)
    @post_image = create(:post_image, user_id: @posted_user.id, theme_id: @theme.id)
    @like = create(:like, user_id: @user.id, post_image_id: @post_image.id)
  end
  it "投稿された画像にいいねを作成できる" do
    expect(@like).to be_valid
  end
  it "ログインユーザーでなければいいねを作成することはできない" do
    @like.user_id = ""
    expect(@like).to_not be_valid
  end
end
