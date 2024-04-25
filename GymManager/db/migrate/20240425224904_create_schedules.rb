class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :training, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
