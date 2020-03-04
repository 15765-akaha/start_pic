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
    when 1..10
      user.update(accivement: "BEGINNER")
    when 11..20
      user.update(accivement: "ROOKIE")
    when 21..30
      user.update(accivement: "CHARRENGER")
    when 31..40
      user.update(accivement: "MASTER")
    end
  end

end

