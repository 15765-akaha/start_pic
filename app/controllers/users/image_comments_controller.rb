class Users::ImageCommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @post_image = PostImage.find(params[:post_image_id])
      @image_comment = current_user.image_comments.new(image_comment_params)
      @image_comment.post_image_id = @post_image.id
      @image_comment.save
      redirect_to post_image_path(@post_image)
    end
  
    def destroy
      @post_image = PostImage.find(params[:post_image_id])
      @image_comment = current_user.image_comments.find_by(id: params[:id],post_image_id: params[:post_image_id])
      @image_comment.destroy
      redirect_to post_image_path(@post_image)
    end

    private
    def image_comment_params
        params.require(:image_comment).permit(:comment)
    end

end
