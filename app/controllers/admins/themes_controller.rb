class Admins::ThemesController < ApplicationController
  def index
    @theme = Theme.new
    @themes = Theme.all.order(:title)
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
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admins_themes_path
  end

  def edit
  end

  def update
  end

  private
   def theme_params
        params.require(:theme).permit(:title, :is_enabled)
   end
end
