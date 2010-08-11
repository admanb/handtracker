class GamePlayers < ActiveRecord::Migration
  def self.up
    create_table :players_games, :id => false do |t|
      t.integer :user_id
      t.integer :game_id
    end
  end

  def self.down
    drop_table :players_games
  end
end
