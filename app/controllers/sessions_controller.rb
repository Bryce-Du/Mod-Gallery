class SessionsController < ApplicationController
    def new
        render "/users/new"
    end
    def create
        # logs the user in if their password authenticates and there is a user with that name
        # redirects with errors if username not found or password incorrect
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            render "/users/new"
        end
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end