class Users::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdrow, :switch]
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
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  

  def likes
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
