class RemoveUselessColumns < ActiveRecord::Migration
  def change
    remove_column :users, :gender
    remove_column :users, :password_digest
    remove_column :efforts, :location
    remove_column :efforts, :sponsors

  end
end
