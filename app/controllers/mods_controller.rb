class ModsController < ApplicationController
    before_action :set_mod, only: [:show]
    before_action :require_login, only: [:create, :new, :download]
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
    def download
        ud = UsersDownload.new(download_params)
        if ud.save
            flash[:notice] = "Download Successful."
            redirect_to mod_path(set_mod)
        else
            byebug
        end
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
        params.require(:users_download).permit(:mod_id, :user_id)
    end
end
