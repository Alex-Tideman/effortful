class CreateUserEfforts < ActiveRecord::Migration
  def change
    create_table :user_efforts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :effort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
