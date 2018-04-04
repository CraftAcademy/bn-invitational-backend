class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :athlete, foreign_key: true
      t.float :score
      t.integer :rating_collection, array: true
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
