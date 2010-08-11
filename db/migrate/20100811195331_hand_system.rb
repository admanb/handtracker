class HandSystem < ActiveRecord::Migration
  def self.up
    create_table :acts do |t|
      t.integer :game_id, :null => false
      t.integer :user_id
      t.integer :card_state_id, :null => false
      t.integer :position
      t.timestamps
      t.string :act_type, :null => false
    end
    create_table :card_states do |t|
      t.integer :deck_id, :null => false
      t.integer :user_id
      t.integer :card_id, :null => false
      t.integer :position
      t.string :status, :null => false, :default => 'draw'
    end
  end

  def self.down
    drop_table :acts
    drop_table :card_states
  end
end
