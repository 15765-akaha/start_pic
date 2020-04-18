class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   after_action :store_action
  
   def store_action
     return unless request.get? # /users/sign_in, /users/sign_up, /users/passwordはsessionに記憶しない。
     if (request.path != "/users/sign_in" &&
         request.path != "/users/sign_up" &&
         request.path != "/users/password" &&
         !request.xhr?) # don't store ajax calls
       session[:previous_url] = request.fullpath 
     end
   end

   protected
   def configure_permitted_parameters
   	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end
end
