class CreateDraws < ActiveRecord::Migration
  def self.up
    create_table :draws do |t|
      t.integer :deck_id
      t.integer :user_id
      t.integer :card_id
      t.timestamps
    end
  end

  def self.down
    drop_table :draws
  end
end
