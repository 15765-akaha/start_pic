class Users::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all.shuffle
  end

  def show
    @post_image = PostImage.find(params[:id])
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
  end

  def destroy
  end

  def search
  end

  private
  def post_image_params
     params.require(:post_image).permit(:image, :caption)
  end

end
