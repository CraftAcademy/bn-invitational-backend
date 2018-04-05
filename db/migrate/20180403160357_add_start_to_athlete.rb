class AddStartToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :starttime, :string
    add_column :athletes, :has_raced, :boolean, default: false
  end
end
