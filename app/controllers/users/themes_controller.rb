class Users::ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
  end

  def search
  end
end
