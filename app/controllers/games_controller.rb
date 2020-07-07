class GamesController < ApplicationController
    before_action :set_game, only: [:show]
    
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
    def show
    end


    private
    def set_game
        @game = Game.find(params[:id])
    end
    def game_params
        params.require(:game).permit(:name)
    end
end
