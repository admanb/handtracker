class CreateDecks < ActiveRecord::Migration
  def self.up
    create_table :decks do |t|
      t.integer :game_id
    end
  end

  def self.down
    drop_table :decks
  end
end
