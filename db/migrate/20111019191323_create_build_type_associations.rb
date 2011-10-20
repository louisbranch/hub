class CreateBuildTypeAssociations < ActiveRecord::Migration
  def change
    create_table :build_type_associations do |t|
      t.integer :build_id
      t.integer :build_type_id

      t.timestamps
    end
  end
end
