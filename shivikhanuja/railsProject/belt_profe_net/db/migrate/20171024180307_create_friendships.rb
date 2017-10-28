class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :friender, foreign_key: true
      t.references :friendee, foreign_key: true

      t.timestamps
    end
  end
end
