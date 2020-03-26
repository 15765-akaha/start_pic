class Users::PostImagesController < ApplicationController
 before_action :set_post_image, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:index, :show, :search]
 before_action :ensure_correct_user, only: [:edit, :destroy]
  def index
    if params[:tag]
      @post_images = PostImage.tagged_with(params[:tag])
    else
      @post_images = PostImage.page(params[:page]).per(30)
    end

  end

  def show
    @image_comment = ImageComment.new
  end

  def new
   if params[:theme_id]
     @theme = Theme.find(params[:theme_id])
     @post_image = PostImage.new
   else
     @post_image = PostImage.new
   end
  end

  def create
    if params[:theme_id] # テーマ部屋から投稿された場合
      @theme = Theme.find(params[:theme_id])
      @post_image = PostImage.new(post_image_params)
      @post_image.user_id = current_user.id
      @post_image.theme_id = @theme.id
      if @post_image.save
        flash[:success] = '投稿しました！'
        redirect_to theme_path(@theme.id)
      end
    else # ヘッダーメニューから投稿された場合
      @post_image = PostImage.new(post_image_params)
      @post_image.user_id = current_user.id
      if @post_image.save
        flash[:success] = '投稿しました！'
        redirect_to post_images_path
      else
        flash.now[:danger] = 'テーマを選択してください'
        render :new
      end
    end


  end

  def edit
  end

  def update
    if @post_image.update(post_image_params)
       flash[:success] = '編集しました！'
       redirect_to post_image_path(@post_image)
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @post_image.destroy
    redirect_to post_images_path
  end

  def search
  end

  private
  def set_post_image
    @post_image = PostImage.find(params[:id])
  end

  def post_image_params
     params.require(:post_image).permit(:image, :caption, :tag_list, :theme_id)
  end

  def ensure_correct_user
    @post_image = PostImage.find(params[:id])
   if current_user.id != @post_image.user.id
      flash[:danger] = "権限がありません"
      redirect_to user_path(current_user.id)
   end
  end
end
