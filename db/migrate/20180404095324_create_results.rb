class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :athlete, foreign_key: true
      t.float :score, default: 0.0
      t.float :rating_collection, array: true, default: []
      t.integer :number_of_votes, default: 0

      t.timestamps
    end
  end
end
