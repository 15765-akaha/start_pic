class Users::ThemesController < ApplicationController
  def index
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

end
