class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'users/new'
        end
    end
    def show

    end
    def edit
    end
    def update
    end
    def destroy
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
