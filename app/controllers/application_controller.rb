class ApplicationController < ActionController::Base
    private
    def require_login
        redirect_to root_path unless !!session[:user_id]
    end
end
