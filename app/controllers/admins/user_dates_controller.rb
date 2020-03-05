class Admins::UserDatesController < ApplicationController
  before_action :set_user , except: [:index]
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user_total_likes = Like.where(post_image_id: @user.post_images.ids).size
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admins_user_date_path(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_enabled)
  end
end
