class CreateSkillTypes < ActiveRecord::Migration
  def change
    create_table :skill_types do |t|
      t.string :name
      t.integer  :char_class_id
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
