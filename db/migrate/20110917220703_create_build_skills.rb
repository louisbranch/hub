class CreateBuildSkills < ActiveRecord::Migration
  def change
    create_table :build_skills do |t|
      t.integer :build_id
      t.integer :skill_id
      t.integer :rune_id

      t.timestamps
    end
  end
end
