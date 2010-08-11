class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :deck_id
      t.text :text
    end
  end

  def self.down
    drop_table :cards
  end
end
