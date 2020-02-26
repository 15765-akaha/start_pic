class Users::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdrow]
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
  end

  def follows
  end

  def followers
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
