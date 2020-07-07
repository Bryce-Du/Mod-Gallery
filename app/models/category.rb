class Category < ApplicationRecord
    has_many :mods_categories
    has_many :mods, through: :mods_categories

    def mod_count(game)
        self.mods.where(game_id: game.id).count
    end
end
