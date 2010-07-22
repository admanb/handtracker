class EditPlays < ActiveRecord::Migration
  def self.up
    rename_column :plays, :deck_id, :game_id
  end

  def self.down
    rename_column :plays, :game_id, :deck_id
  end
end
