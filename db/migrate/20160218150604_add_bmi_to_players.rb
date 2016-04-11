class AddBmiToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :weight, :decimal
    add_column :players, :height, :decimal
  end
end
