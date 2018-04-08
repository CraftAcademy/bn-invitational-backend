class AddVotingOpenToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :votingOpen, :boolean, default: false
  end
end
