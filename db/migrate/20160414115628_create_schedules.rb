class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :description
      t.string :image
      t.references :section, index: true

      t.timestamps
    end
  end
end
