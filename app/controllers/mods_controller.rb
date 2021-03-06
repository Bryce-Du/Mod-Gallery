class ModsController < ApplicationController
    before_action :set_mod, only: [:show, :edit, :update, :destroy, :download, :endorse]
    before_action :require_login, only: [:create, :new, :download, :edit, :update, :endorse, :destroy]
    def new
        @mod = Mod.new
    end
    def create
        @mod = Mod.new(mod_params)
        if @mod.save
            redirect_to user_mod_path(@mod.creator_id, @mod) 
        else
            render 'new'
        end
    end
    def show
    end
    def index
        if params[:game_id]
            @game = Game.find(params[:game_id])
            @mods = @game.mods
            if params[:category_id]
                @mods = Mod.joins(:categories).merge(Category.where(id: params[:category_id])).where(game_id: params[:game_id])
                @category = Category.find(params[:category_id])

            end
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
        redirect_to game_mod_path(@mod.game_id, @mod)
    end
    def endorse
        ud = UsersDownload.find_by(mod_id: download_params[:mod_id], user_id: download_params[:user_id])
        if !ud.endorsed
            ud.endorsed = true
            ud.save
        else
            flash[:notice] = "An error occurred."
        end
        redirect_to game_mod_path(@mod.game_id, @mod)
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
