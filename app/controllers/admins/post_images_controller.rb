class Admins::PostImagesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post_images = PostImage.page(params[:page]).per(20)
    page_num = PostImage.page(params[:page]).current_page
    @base_level = (page_num - 1)*20

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admins_post_images_path
  end
end
