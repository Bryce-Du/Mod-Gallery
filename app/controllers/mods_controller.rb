class ModsController < ApplicationController
    before_action :set_mod, only: [:show]

    def show
    end

    private
    def set_mod
        @mod = Mod.find(params[:id])
    end
end
