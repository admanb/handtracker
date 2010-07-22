class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :deck_id
      t.string :text
      t.integer :position
      t.boolean :discarded, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
