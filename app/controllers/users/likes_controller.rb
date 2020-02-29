class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.new(post_image_id: params[:post_image_id])
    like.save
    redirect_back(fallback_location: root_path)
  end
    
  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.find_by(post_image_id: params[:post_image_id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
