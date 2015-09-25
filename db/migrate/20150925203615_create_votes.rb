class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :yes, default: 0
      t.integer :no, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :effort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
