class Mod < ApplicationRecord
  belongs_to :game
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  has_many :users_downloads
  has_many :downloads, through: :users_downloads, source: :user
  has_many :mods_categories
  has_many :categories, through: :mods_categories
end
