class Users::ThemesController < ApplicationController
  def index
      @theme = Theme.new
    if params[:search] #検索が含まれていたら
      @themes = Theme.search(params[:search]).page(params[:page]).per(12)
    else
      @themes = Theme.page(params[:page]).per(12)
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @post_images = @theme.post_images.page(params[:page]).per(24)
  end

  def sort #いいね順にトップ３を取り出す。
    @theme = Theme.find(params[:id])
    @post_images = @theme.post_images.find(Like.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
    # @theme = Theme.find(params[:id]) # テーマに投稿された画像のいいね数を配列として取り出して、いいね数を基準にソートして上位から取り出す。
    # post_image_like_count = @theme.post_images.joins(:likes).group(:post_image_id).count
    # post_image_liked_ids = Hash[post_image_like_count.sort_by{ |k, v| -v }].keys
    # @post_images = PostImage.where(id: post_image_liked_ids)
  end
end
