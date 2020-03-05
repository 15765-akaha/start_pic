class Admins::UserDatesController < ApplicationController
  before_action :set_user , except: [:index]
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @user_total_likes = Like.where(post_image_id: @user.post_images.ids).size
  end

  def edit
  end

  def update
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
