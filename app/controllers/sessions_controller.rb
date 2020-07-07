class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        if auth_hash
            @user = User.find_or_create_by_auth(auth_hash)
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                render '/sessions/new'
            end
        end
    end
    def main
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
    
    private
    def auth_hash
        request.env['omniauth.auth']
    end
    def user_params
        params.require(:user).permit(:username, :password)
    end
end