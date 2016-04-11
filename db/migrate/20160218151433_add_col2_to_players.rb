class AddCol2ToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :bmi, :decimal
  end
end
