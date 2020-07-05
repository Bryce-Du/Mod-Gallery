class SessionsController < ApplicationController
    def new
        render "/users/new"
    end
    def create
        # logs the user in if their password authenticates and there is a user with that name
        # redirects with errors if username not found or password incorrect
        if @user = User.find_by(username: params[:user][:username])
            #log them in
        else
            render "/users/new"
        end
    end
    def destroy
    end

end