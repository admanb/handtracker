class AddPlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.integer :deck_id
      t.integer :user_id
      t.integer :card_id
      t.timestamps
    end
  end

  def self.down
    drop_table :plays
  end
end
