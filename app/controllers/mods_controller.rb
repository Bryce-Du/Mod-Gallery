class ModsController < ApplicationController
    before_action :set_mod, only: [:show]
    def new
        @mod = Mod.new
        3.times {@mod.mods_categories.build}
    end
    def create
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
            mods_categories_attributes: [:category_id]
        )
    end
end
