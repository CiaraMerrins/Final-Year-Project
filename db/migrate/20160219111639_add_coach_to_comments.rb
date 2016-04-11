class AddCoachToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :coach, index: true
  end
end
