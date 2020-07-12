class Game < ApplicationRecord
    has_many :mods

    validates :name, uniqueness: true, presence: true

    def mod_count
        self.mods.count
    end
    def total_downloads
        self.mods.map{|mod| mod.download_count}.reduce(:+)
    end
    def self.all_by_mod_count
        order(:mod_count, :desc)
    end
    def latest
        self.mods.limit(5).reverse_order
    end
end
