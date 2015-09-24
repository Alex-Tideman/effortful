class AddYesVoteAndNoVoteToEffort < ActiveRecord::Migration
  def change
    add_column :efforts, :yes_vote, :integer, default: 0
    add_column :efforts, :no_vote, :integer, default: 0
  end
end
