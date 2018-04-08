class AddStartToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :starttime, :string
    add_column :athletes, :hasraced, :boolean, default: false
  end
end
