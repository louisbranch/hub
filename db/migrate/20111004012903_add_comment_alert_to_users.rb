class AddCommentAlertToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.boolean :comment_alert, :default => true
    end
  end
end
