class AddTemplates < ActiveRecord::Migration
  def self.up
    add_column :cards, :template_id, :integer
    create_table :templates do |t|
      t.string :name
    end
  end

  def self.down
    remove_column :cards
    drop_table :templates
  end
end
