class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :sender, :null => false
      t.integer :accepter, :null => false
      t.boolean :status, :null => false

      t.timestamps
    end
    add_index :friendships, :sender
    add_index :friendships, :accepter
    add_index :friendships, :status
  end
end