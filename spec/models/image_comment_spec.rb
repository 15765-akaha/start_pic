require 'rails_helper'

RSpec.describe "投稿画像に対するコメントのテスト", type: :model do
  before do
    @posted_user = create(:user)
    @comment_user = create(:user)
    @theme = create(:theme, admin:true)
    @post_image = create(:post_image, user_id: @posted_user.id, theme_id: @theme.id)
    @image_comment = build(:image_comment, user_id: @comment_user.id, post_image_id: @post_image.id)
  end

  it "投稿された画像ID,コメントするユーザーID,コメントが入力されているため作成できる" do
    expect(@image_comment).to be_valid
  end
  it "コメントが空白の場合、作成できない" do
    @image_comment.comment = ""
    expect(@image_comment).to_not be_valid
  end
  it "コメントが100文字以内でないため作成できない" do
    @image_comment.comment = Faker::Lorem.characters(number:101)
    expect(@image_comment).to_not be_valid
  end
  it "コメントユーザーのIDがない場合、作成できない" do
    @image_comment.user_id = ""
    expect(@image_comment).to_not be_valid
  end
end
