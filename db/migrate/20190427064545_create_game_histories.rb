class CreateGameHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :game_histories do |t|
      t.references :game
      t.references :question
    end
  end
end
