class AddPlayerToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :player, index: true
  end
end
