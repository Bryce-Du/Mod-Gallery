class ApplicationController < ActionController::Base
    private
    def current_user
        if session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    end
end
