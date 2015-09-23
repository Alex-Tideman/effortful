class AddVolunteerAndSponsorToEffort < ActiveRecord::Migration
  def change
    add_column    :efforts, :volunteer_id, :integer
    add_column    :efforts, :sponsors, :string
  end
end
