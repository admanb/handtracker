class EditDeckStructure < ActiveRecord::Migration
  def self.up
    rename_column :draws, :deck_id, :game_id
    remove_column :cards, :discarded
    add_column :draws, :discard_id, :integer
  end

  def self.down
  end
end
