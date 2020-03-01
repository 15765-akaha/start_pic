class Users::PostImagesController < ApplicationController
 before_action :set_post_image, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @post_images = PostImage.all.shuffle
  end

  def show
    @image_comment = ImageComment.new
  end

  def new
    @theme = Theme.find(params[:theme_id])
    @post_image = PostImage.new
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.theme_id = @theme.id
    @post_image.save
    redirect_to theme_path(@theme.id)
  end

  def edit
  end

  def update
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image)
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
     params.require(:post_image).permit(:image, :caption)
  end

end
