class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :home
      t.integer :age

      t.timestamps
    end
  end
end
