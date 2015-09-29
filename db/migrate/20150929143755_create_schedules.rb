class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :effort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
