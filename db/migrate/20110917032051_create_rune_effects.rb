class CreateRuneEffects < ActiveRecord::Migration
  def change
    create_table :rune_effects do |t|
      t.string :name
      t.text :description
      t.integer :skill_id
      t.integer :rune_id
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
