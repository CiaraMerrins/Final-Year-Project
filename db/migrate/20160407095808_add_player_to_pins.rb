class AddPlayerToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :player, index: true
  end
end
