class User < ApplicationRecord
    has_many :users_downloads
    has_many :downloads, through: :users_downloads, source: :mod
    has_many :comments
    # has_many :commented_mods, through: :comments, source: :mod # really shouldn't need to access this, you'd want to see which users have commented on a mod, but not which mods a user has commented on
    has_many :creations, class_name: "Mod"
    has_secure_password

    validates :username, presence: true
    validates :password, presence: true
    validates :password, length: {in: 8..16}
    validates :password, confirmation: { case_sensitive: true }

    def self.find_or_create_by_auth(auth_hash)
        if @user = User.find_by(username: auth_hash[:uid])
            @user
        else
            @user = User.create(username: auth_hash[:uid], password: SecureRandom.hex)
        end
    end
end
