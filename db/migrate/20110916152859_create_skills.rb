class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer  :level
      t.string :name
      t.text :description
      t.string :img_url
      t.string :cost
      t.string :generate
      t.string :cooldown
      t.integer  :char_class_id
      t.integer  :skill_type_id
      t.string :slug, :unique => true
      t.references :char_class
      t.timestamps
    end
  end
end
