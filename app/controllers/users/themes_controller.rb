class Users::ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
    @post_images = @theme.post_images.all
  end

  def search
    @themes = Theme.search(params[:search])
  end

end
