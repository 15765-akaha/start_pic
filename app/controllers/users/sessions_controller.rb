# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
  def after_sign_in_path_for(resource)
    if resource.is_enabled == false    #(resource)に入った値のユーザーのステータスが退会済になっていたら強制退去
       sign_out resource
       root_path
    elsif 
       session[:previous_url] == '/'   # topページからのログインの場合はユーザーページに遷移
       user_path(resource)
    else
       session[:previous_url] || root_path #　それ以外はログインが要求される前のページに遷移
    end
  end
end