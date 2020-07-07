class GamesController < ApplicationController
    def index
        @games = Game.all_by_mod_count
    end
    def new
        @game = Game.new
    end
    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to games_path
        else
            render "/games/new"
        end
    end


    private
    def game_params
        params.require(:game).permit(:name)
    end
end
