class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :user_id, :null => false
      t.integer :deck_id, :null => false
      t.boolean :can_draw, :default => true
      t.boolean :can_draw_to_hand, :default => true
      t.boolean :can_shuffle, :default => false
      t.boolean :can_give, :default => false
    end
  end

  def self.down
    drop_table :permissions
  end
end
