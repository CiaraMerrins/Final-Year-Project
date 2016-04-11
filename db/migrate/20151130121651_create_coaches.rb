class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :gender
      t.integer :sport_id

      t.timestamps
    end
  end
end
