class ModsController < ApplicationController
    before_action :set_mod, only: [:show]
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
end
