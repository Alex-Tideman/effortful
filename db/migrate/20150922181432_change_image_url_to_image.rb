class ChangeImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :users, :image_url, :image
    remove_column :users, :location
    add_column :users, :gender, :string
  end
end
