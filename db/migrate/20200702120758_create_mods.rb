class CreateMods < ActiveRecord::Migration[6.0]
  def change
    create_table :mods do |t|
      t.string :name
      t.text :description
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
