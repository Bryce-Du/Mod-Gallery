class Category < ApplicationRecord
    has_many :mods_categories
    has_many :mods, through: :mods_categories
end
