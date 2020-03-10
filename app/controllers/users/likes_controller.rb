class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  after_action :appraise_user, only: [:create]
  def create
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.new(post_image_id: params[:post_image_id])
    like.save
  end
    
  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.find_by(post_image_id: params[:post_image_id])
    like.destroy
  end

  private
  def appraise_user
    user = @post_image.user # いいねがされた時に、そのユーザーの投稿画像のいいね数に応じて称号を評価する。
    total_likes = Like.where(post_image_id: user.post_images.ids).size
    case total_likes
    when 1..2
      user.update(achivement: "BEGINNER")
    when 3..4
      user.update(achivement: "ROOKIE")
    when 5..30
      user.update(achivement: "CHALLENGER")
    when 31..40
      user.update(achivement: "MASTER")
    end
  end
end

