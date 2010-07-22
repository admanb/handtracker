class FixDeckStructure < ActiveRecord::Migration
  def self.up
    add_column :cards, :discard_id, :integer
    remove_column :draws, :discard_id
  end

  def self.down
  end
end
