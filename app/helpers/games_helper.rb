module GamesHelper
    def selected_game
        if params[:controller] == "games" && params[:id]
            Game.find(params[:id])
        elsif params[:game_id]
            Game.find(params[:game_id])
        end
    end
    def selected_game_name
        !!selected_game ? selected_game.name : ""
    end
end
