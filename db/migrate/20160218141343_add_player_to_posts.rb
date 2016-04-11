class AddPlayerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :player_id, :integer
  end
end
