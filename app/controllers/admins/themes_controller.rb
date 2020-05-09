class Admins::ThemesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_theme, only: [:edit, :update, :destroy]

  def index
    @theme = Theme.new
    themes = Theme.order(:title).all

    array = [] #テーマ部屋と作成したユーザーの情報を取ってビューでeachを回すために配列を用意
    themes.each do |theme|
      hash = {
        :theme => theme,
        :create_user => theme.create_user_id.present? ? User.find(theme.create_user_id) : "" #create_user_idをUserから参照：nill判定
      }
      array.push(hash)
    end
      @view_themes = Kaminari.paginate_array(array).page(params[:page]).per(12) #配列用のページネーションメソッド
      page_num = Kaminari.paginate_array(array).page(params[:page]).current_page #現在のページ番号を取得
      @base_level = (page_num-1)*12 #通し番号のベースの作成
  end
  def create
    @theme = Theme.new(theme_params)
    @theme.admin = true
    if @theme.save
       flash[:success] = 'テーマを作成しました！'
       redirect_to admins_themes_path
    else
       flash[:danger] = '同タイトルが存在します'
       redirect_to admins_themes_path
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
