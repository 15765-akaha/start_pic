class Users::UsersController < ApplicationController
  before_action :authenticate_user! , except: [:show]
  before_action :set_user
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
    if @user.update(user_params)
      flash[:success] = '登録情報を変更しました！'
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = '変更に失敗しました。'
      render :edit
    end
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

end
