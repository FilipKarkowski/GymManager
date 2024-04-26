class AddTimeToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :time, :time
  end
end
