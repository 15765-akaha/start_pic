class Users::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdrow, :switch, :follows, :followers, :likes]
  before_action :appraise_user, only: [:show]
  def show
    @post_images = @user.post_images #投稿画像
    @like_post_images = @user.likes_post_images #いいねした画像
    @followings = @user.followings #フォロー
    @followers = @user.followers #フォロワー
    @total_likes = Like.where(post_image_id: @user.post_images.ids).size
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def withdrow
  end

  def switch
    if @user.update(is_enabled: false)
       sign_out current_user # サインアウト
    end
       redirect_to root_path
  end
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def appraise_user
    @total_likes = Like.where(post_image_id: @user.post_images.ids).size
    case @total_likes
    when 1..9
      @user.update(accivement: "BEGINNER")
    when 10..20
      @user.update(accivement: "ROOKIE")
    end
  end

end
