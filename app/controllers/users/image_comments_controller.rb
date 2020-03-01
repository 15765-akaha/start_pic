class Users::ImageCommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @image_comment = current_user.image_comments.new(image_comment_params)
    end
  
    def destroy
    end

    private
    # def image_commnet_params
    #     require(:image_comment).permit()
    # end

  end
end
