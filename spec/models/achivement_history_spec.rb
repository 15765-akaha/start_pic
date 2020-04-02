require 'rails_helper'

RSpec.describe AchivementHistory, type: :model do
  before do
    @user = create(:user)
    @history = build(:achivement_history, user_id:@user.id)
  end

  it "ユーザーと称号が存在する時ヒストリーが保存できる" do
    expect(@history).to be_valid
  end 
end

