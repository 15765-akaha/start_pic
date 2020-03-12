class Users::ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :update, :destroy]
  def index
      @theme = Theme.new
    if params[:search] #検索が含まれていたら
      @themes = Theme.search(params[:search]).page(params[:page]).per(16)
    else
      @themes = Theme.where(is_enabled: true).page(params[:page]).per(12)
    end
  end

  def create
      @theme = Theme.new(theme_params)
   if @theme.save
       flash[:success] = 'テーマを作成しました！'
       redirect_to themes_path
   else
       flash.now[:danger] = 'テーマを作成できませんでした。'
       @themes = Theme.order(:title).page(params[:page]).per(16)
       render :index
   end
  end

  def show
    @post_images = @theme.post_images.page(params[:page]).per(24)
  end

  def update

    if @theme.update(theme_params)
      flash[:success] = 'テーマを編集しました！'
      redirect_to theme_path(@theme)
   else
      flash.now[:danger] = '編集できませんでした'
      render :show
   end
  end

  def destroy
    @theme.update(is_enabled: false) # 論理削除
    flash.now[:danger] = '作成したテーマを削除しました'
    @theme = Theme.new
    redirect_to themes_path
  end


  def sort #いいね順にトップ３を取り出す。
    @theme = Theme.find(params[:id])
    @post_images = @theme.post_images.find(Like.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
    # @theme = Theme.find(params[:id]) # テーマに投稿された画像のいいね数を配列として取り出して、いいね数を基準にソートして上位から取り出す。
    # post_image_like_count = @theme.post_images.joins(:likes).group(:post_image_id).count
    # post_image_liked_ids = Hash[post_image_like_count.sort_by{ |k, v| -v }].keys
    # @post_images = PostImage.where(id: post_image_liked_ids)
  end

  private
  def set_theme
    @theme = Theme.find(params[:id])
  end
  def theme_params
    params.require(:theme).permit(:title, :is_enabled)
  end
end
