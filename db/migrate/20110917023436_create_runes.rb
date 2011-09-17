class CreateRunes < ActiveRecord::Migration
  def change
    create_table :runes do |t|
      t.string :name

      t.timestamps
    end
  end
end
