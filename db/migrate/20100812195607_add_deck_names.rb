class AddDeckNames < ActiveRecord::Migration
  def self.up
    add_column :decks, :name, :string
  end

  def self.down
  end
end
