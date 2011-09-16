class CreateSkillTypes < ActiveRecord::Migration
  def change
    create_table :skill_types do |t|
      t.string :type
      t.string :subtype

      t.timestamps
    end
  end
end
