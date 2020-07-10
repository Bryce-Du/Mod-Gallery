class Mod < ApplicationRecord
  belongs_to :game
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  has_many :users_downloads
  has_many :downloads, through: :users_downloads, source: :user
  has_many :mods_categories
  has_many :categories, through: :mods_categories
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
 
  validates :name, presence: true, uniqueness: {scope: :game}
  validates :game_id, presence: true
  validates :description, presence: true
  validates :category_ids, presence: {message: "Must select at least one Category."}

  def truncated_description
    self.description.truncate(30)  
  end
  def download_count
    downloads.count
  end
  def endorsements
    users_downloads.endorsed.count
  end
end
