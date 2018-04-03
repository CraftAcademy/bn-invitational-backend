class AddStartToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :start_time, :time
    add_column :athletes, :has_raced, :boolean, default: false
  end
end
