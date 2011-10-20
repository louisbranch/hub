class CreateBuildTypes < ActiveRecord::Migration
  def change
    create_table :build_types do |t|
      t.string :name
      t.text :description
      t.string :acronym
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
