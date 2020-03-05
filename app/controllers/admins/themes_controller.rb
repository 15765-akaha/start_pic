class Admins::ThemesController < ApplicationController
before_action :set_theme, only: [:edit, :update, :destroy]

  def index
    @theme = Theme.new
    @themes = Theme.order(:title).page(params[:page]).per(15)
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
       redirect_to admins_themes_path
    else
       @themes = Theme.all.order(:title)
       render :index
    end
  end

  def destroy
    @theme.destroy
    redirect_to admins_themes_path
  end

  def edit
  end

  def update
    @theme.update(theme_params)
    redirect_to admins_themes_path
  end

  private
   def set_theme
      @theme = Theme.find(params[:id])
   end
   def theme_params
        params.require(:theme).permit(:title, :is_enabled)
   end
end
