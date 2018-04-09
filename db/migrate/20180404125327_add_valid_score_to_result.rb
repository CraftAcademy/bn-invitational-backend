class AddValidScoreToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :validscore, :boolean, default: false
  end
end
