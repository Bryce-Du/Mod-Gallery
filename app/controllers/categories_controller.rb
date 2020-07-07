class CategoriesController < ApplicationController
    before_action :set_game, only: [:index]
    def index
        @categories = Category.all
    end

    private
    def set_game
        @game = Game.find(params[:game_id])
    end
end
