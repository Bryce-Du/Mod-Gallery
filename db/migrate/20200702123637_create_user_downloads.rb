class CreateUserDownloads < ActiveRecord::Migration[6.0]
  def change
    create_table :user_downloads do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :mod, null: false, foreign_key: true
      t.boolean :endorsed

      t.timestamps
    end
  end
end
