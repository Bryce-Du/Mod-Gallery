class Mod < ApplicationRecord
  belongs_to :game
  has_many :comments, :dependent => :destroy
  has_many :commenters, through: :comments, source: :user, :dependent => :destroy
  has_many :users_downloads, :dependent => :destroy
  has_many :downloads, through: :users_downloads, source: :user, :dependent => :destroy
  has_many :mods_categories, :dependent => :destroy
  has_many :categories, through: :mods_categories, :dependent => :destroy
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
