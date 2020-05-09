class Admins::UserDatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user , except: [:index]
  def index
    @users = User.page(params[:page]).per(10)
    page_num = User.page(params[:page]).current_page
    @base_level = (page_num-1)*10
  end

  def show
    @user_total_likes = Like.where(post_image_id: @user.post_images.ids).size
  end

  def edit
  end

  def update
    if @user.update(user_params)
       flash[:success] = 'ユーザー情報を変更しました！'
       redirect_to admins_user_date_path(@user)
    else
       flash.now[:danger] = '変更に失敗しました。'
       render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_enabled)
  end
end
