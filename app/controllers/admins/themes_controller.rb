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
        :create_user => theme.create_user_id.present? ? User.find(theme.create_user_id) : ""
      #   if theme.create_user_id.present? #create_user_idが存在していたらユーザーモデルから合致する情報を取る。
      #    :create_user => User.find(theme.create_user_id)
      #   else #nill判定
      #    :create_user => ""
      #   end
      }
      array.push(hash)
   end
      @view_themes = Kaminari.paginate_array(array).page(params[:page]).per(12) #配列用のページネーションメソッド
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
