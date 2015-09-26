class AddCenterAndRadiusToEffort < ActiveRecord::Migration
  def change
    add_column :efforts, :ne_lat, :float
    add_column :efforts, :ne_lng, :float
    add_column :efforts, :sw_lat, :float
    add_column :efforts, :sw_lng, :float
  end
end
