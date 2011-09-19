class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.text :description
      t.integer :min_level
      t.integer :recommended_level
      t.boolean :private
      t.integer :user_id
      t.integer :char_class_id
      t.integer :forked_id
      t.references :user
      t.timestamps
    end
  end
end
