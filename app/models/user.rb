class User < ApplicationRecord
    has_many :users_downloads
    has_many :downloads, through: :users_downloads, source: :mod
    has_many :comments
    # has_many :commented_mods, through: :comments, source: :mod # really shouldn't need to access this, you'd want to see which users have commented on a mod, but not which mods a user has commented on
    has_many :creations, class_name: "Mod", foreign_key: "creator_id"
    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true, on: :create
    validates :password, length: {in: 8..32}, on: :create
    validates :password, confirmation: { case_sensitive: true }, on: :create

    def self.find_or_create_by_auth(auth_hash)
        if @user = User.find_by(username: auth_hash[:uid])
            @user
        else
            @user = User.create(username: auth_hash[:uid], password: SecureRandom.hex)
        end
    end
    def downloaded(mod)
        UsersDownload.where(mod_id: mod.id).where(user_id: self.id)
    end
end
