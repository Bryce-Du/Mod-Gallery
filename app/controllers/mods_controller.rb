class ModsController < ApplicationController
    before_action :set_mod, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:create, :new, :download, :edit, :update, :endorse, :destroy]
    def new
        @mod = Mod.new
    end
    def create
        @mod = Mod.new(mod_params)
        if @mod.save
            redirect_to mod_path(@mod)
        else
            render 'new'
        end
    end
    def show
    end
    def index
        if params[:game_id]
            @mods = Mod.where(game_id: params[:game_id])
        end
    end
    def edit
    end
    def update
        if @mod.update(mod_params)
            redirect_to user_mod_path(@mod)
        else
            render 'edit'
        end
    end
    def destroy
        @mod.destroy
        redirect_to user_path(params[:user_id])
    end
    def download
        ud = UsersDownload.new(download_params)
        if ud.save
            flash[:notice] = "Download Successful."
        else
            flash[:notice] = "An error occurred."
        end
        redirect_to mod_path(set_mod)
    end
    def endorse
        ud = UsersDownload.where(mod_id: download_params[:mod_id]).where(user_id: download_params[:user_id]).first
        if !ud.endorsed
            ud.endorsed = true
            ud.save
        else
            flash[:notice] = "An error occurred."
        end
        redirect_to mod_path(set_mod)
    end

    private
    def set_mod
        @mod = Mod.find(params[:id])
    end
    def mod_params
        params.require(:mod).permit(
            :name, 
            :creator_id, 
            :game_id,
            :description,
            category_ids: []
        )
    end
    def download_params
        params.require(:users_download).permit(:mod_id, :user_id, :endorsed)
    end
end
