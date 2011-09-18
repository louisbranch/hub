class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :char_class_id
      t.references :user
      t.timestamps
    end
  end
end
