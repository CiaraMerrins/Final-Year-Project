class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :gender
      t.date :dob
      t.integer :sport1
      t.integer :sport2

      t.timestamps
    end
  end
end
