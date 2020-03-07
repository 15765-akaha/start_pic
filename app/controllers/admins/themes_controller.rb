class Admins::ThemesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_theme, only: [:edit, :update, :destroy]

  def index
    @theme = Theme.new
    @themes = Theme.order(:title).page(params[:page]).per(15)
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
       flash[:success] = 'テーマを作成しました！'
       redirect_to admins_themes_path
    else
       flash.now[:danger] = 'タイトルを入力してください'
       @themes = Theme.order(:title).page(params[:page]).per(15)
       render :index
    end
  end

  def destroy
    @theme.destroy
    flash[:danger] = 'テーマを削除しました'
    redirect_to admins_themes_path
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
       flash[:success] = 'テーマを編集しました！'
       redirect_to admins_themes_path
    else
       flash.now[:danger] = 'タイトルを入力してください'
       render :edit
    end
  end

  private
   def set_theme
      @theme = Theme.find(params[:id])
   end
   def theme_params
      params.require(:theme).permit(:title, :is_enabled)
   end
end
