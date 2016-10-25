class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
       if !session[:current_user]
           flash[:error] = "You need to be logged in"
           redirect_to "/login"
       end
   end

   def current_user
     if session[:current_user] != nil
       return User.find(session[:current_user]["id"])
     else
       false
     end
   end

   helper_method :current_user
end
