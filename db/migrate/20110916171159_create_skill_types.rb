class CreateSkillTypes < ActiveRecord::Migration
  def change
    create_table :skill_types do |t|
      t.string :main
      t.string :sub
      t.integer  :char_class_id
      t.timestamps
    end
  end
end
