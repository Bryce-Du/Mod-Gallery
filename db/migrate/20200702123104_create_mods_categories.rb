class CreateModsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :mods_categories do |t|
      t.belongs_to :mod, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
