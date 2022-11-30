class ApplicationController < ActionController::Base
     include SessionsHelper  #追記
     include Pagy::Backend  #追記
     
     private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
