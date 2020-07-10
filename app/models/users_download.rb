class UsersDownload < ApplicationRecord
  belongs_to :user
  belongs_to :mod

  scope :endorsed, -> { where(endorsed: true) }
  validates_uniqueness_of :mod_id, scope: :user_id
end
