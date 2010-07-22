class RedoHandTable < ActiveRecord::Migration
  def self.up
    rename_column :card_in_hands, :hand_id, :deck_id
  end

  def self.down
  end
end
