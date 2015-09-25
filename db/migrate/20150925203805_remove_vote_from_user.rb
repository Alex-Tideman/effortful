class RemoveVoteFromUser < ActiveRecord::Migration
  def change
    remove_column :efforts, :yes_vote
    remove_column :efforts, :no_vote
  end
end
