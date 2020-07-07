class ModsController < ApplicationController
    before_action :set_mod, only: [:show]
    def new
        @mod = Mod.new
    end
    def create
    end
    def show
    end

    private
    def set_mod
        @mod = Mod.find(params[:id])
    end
end
