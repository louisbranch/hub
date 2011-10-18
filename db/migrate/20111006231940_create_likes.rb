class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :vote
      t.integer :user_id
      t.integer :build_id

      t.timestamps
    end
  end
end
