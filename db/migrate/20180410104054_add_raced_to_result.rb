class AddRacedToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :has_raced, :boolean, default: false
  end
end
