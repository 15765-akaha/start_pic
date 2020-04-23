class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.new(post_image_id: params[:post_image_id])
    ActiveRecord::Base.transaction do #いいねの数に応じてユーザーのデータを変更するためトランザクション処理
    like.save! #いいねをつける
    @post_image.user.appraise_user! #ユーザーの称号評価メソッドを行う。
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    like = current_user.likes.find_by(post_image_id: params[:post_image_id])
    like.destroy
  end
end

