class CreateMediaRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :media_rankings do |t|
      t.references :medium
      t.references :genre
      t.integer :rank, null: false

      t.timestamps
    end
  end
end
