class ChangeUserDownloadToUsersDownload < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_downloads, :users_downloads
  end
end
