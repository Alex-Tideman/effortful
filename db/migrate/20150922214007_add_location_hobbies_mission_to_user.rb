class AddLocationHobbiesMissionToUser < ActiveRecord::Migration
  def change
    add_column :users, :hobby, :string
    add_column :users, :mission, :string
    add_column :users, :location, :string
  end
end
