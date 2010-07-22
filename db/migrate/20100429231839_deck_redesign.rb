class DeckRedesign < ActiveRecord::Migration
  def self.up
    create_table :card_in_hands do |t|
      t.integer :hand_id
      t.integer :card_id
      t.integer :user_id
    end
    create_table :available_cards do |t|
      t.integer :deck_id
      t.integer :card_id
      t.integer :position
    end
    create_table :discarded_cards do |t|
      t.integer :deck_id
      t.integer :card_id
      t.integer :position  
    end
    create_table :decks_cards do |t|
      t.integer :deck_id
      t.integer :card_id
    end
    remove_column :cards, :position
    remove_column :cards, :discard_id
  end
  def self.down
  end
end
