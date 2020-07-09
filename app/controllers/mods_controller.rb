class ModsController < ApplicationController
    before_action :set_mod, only: [:show]
    def new
        @mod = Mod.new
    end
    def create
        @mod = Mod.new(mod_params)
        if @mod.save
            redirect_to user_mod_path(@mod.creator_id, @mod)
        else
            render new_user_mod_path(current_user)
        end
    end
    def show
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
