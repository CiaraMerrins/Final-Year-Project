class AddCoachToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :coach, index: true
  end
end
