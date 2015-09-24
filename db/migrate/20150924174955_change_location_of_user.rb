class ChangeLocationOfUser < ActiveRecord::Migration
  def change
    change_column :users, :location, :string, default: "sound.misty.loads"
  end
end
