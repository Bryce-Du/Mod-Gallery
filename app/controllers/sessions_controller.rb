class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render "/sessions/new"
        end
    end
    def main
        @user = current_user
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
    
end