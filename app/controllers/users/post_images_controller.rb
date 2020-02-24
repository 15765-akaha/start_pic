class Users::PostImagesController < ApplicationController
  def index
    @post_image = PostImage.all
  end

  def show
  end

  def new
    @post_image = PostImage.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end
end
