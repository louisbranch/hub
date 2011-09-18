class CreateCharClasses < ActiveRecord::Migration
  def change
    create_table :char_classes do |t|
      t.string :name
      t.text :description
      t.string :resource
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
