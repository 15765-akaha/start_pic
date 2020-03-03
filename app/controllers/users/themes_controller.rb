class Users::ThemesController < ApplicationController
  def index
    if params[:search] #検索が含まれていたら
      @themes = Theme.search(params[:search])
    else
      @themes = Theme.all
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @post_images = @theme.post_images.all
  end

end
