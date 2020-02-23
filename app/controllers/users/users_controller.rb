class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def withdrow
  end

  def switch
  end

  def follows
  end

  def followers
  end

  def likes
  end
end
