class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :unique => true
      t.text :description
      t.integer :server_id
      t.integer :clan_id
      t.boolean :admin
      t.boolean :premium
      t.string :slug, :unique => true
      t.timestamps
    end
  end
end
