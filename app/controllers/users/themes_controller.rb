class Users::ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :update, :destroy]
  before_action :forbit_test_user, only: [:create, :update, :destroy]
  before_action :forbit_unauthorized_user, only: [:create, :update, :destroy]
  def index
      @theme = Theme.new
    if params[:search] #検索が含まれていたら
      @themes = Theme.search(params[:search]).page(params[:page]).per(12)
    else
      @themes = Theme.where(is_enabled: true).order(:title).page(params[:page]).per(12)
    end
  end

  def create
      @theme = Theme.new(theme_params)
      @theme.create_user_id = current_user.id
   if @theme.save
       flash[:success] = 'テーマを作成しました！'
       redirect_to themes_path
   else
       flash.now[:danger] = 'テーマを作成できませんでした。'
       @themes = Theme.order(:title).page(params[:page]).per(12)
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

  private
  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:title, :is_enabled)
  end

  def forbit_test_user
    if current_user.email == "test@example.com"
      flash[:danger]= "テストユーザーのためテーマの作成はできません"
      redirect_to themes_path
    end
  end

  def forbit_unauthorized_user
    if current_user.achivement == "BEGINNER" || current_user.achivement == "ROOKIE"
      flash[:danger]="権限がありません"
      redirect_to themes_path
    end
  end
end
