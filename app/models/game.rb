class Game < ApplicationRecord
    has_many :mods

    validates :name, uniqueness: true, presence: true

    def mod_count
        self.mods.count
    end
    def self.all_by_mod_count
        order(:mod_count, :desc)
    end
end
