class AddKarmaToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :karma, :integer, :default => 0
  end
end