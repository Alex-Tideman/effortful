class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :start_date
      t.string :length
      t.string :requested_reward
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
