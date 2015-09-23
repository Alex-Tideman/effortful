class RenameUserIdToMemberIdForEffort < ActiveRecord::Migration
  def change
    rename_column :efforts, :user_id, :member_id
  end
end
