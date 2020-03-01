class Users::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdrow, :switch, :follows, :followers, :likes]
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
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

  def follows
<<<<<<< Updated upstream
  end

  def followers
=======
    @users = @user.followings
  end

  def followers
    @users = @user.followers
>>>>>>> Stashed changes
  end

  def likes
    @like_post_images = @user.likes_post_images
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
