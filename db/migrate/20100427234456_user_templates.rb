class UserTemplates < ActiveRecord::Migration
  def self.up
    add_column :templates, :user_id, :integer
    add_column :templates, :public, :boolean, :default => true
  end

  def self.down
    remove_column :templates, :user_id
    remove_column :templates, :public
  end
end
