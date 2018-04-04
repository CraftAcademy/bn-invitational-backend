class AddValidScoreToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :valid_score, :boolean, default: false
  end
end
