class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.references :parent
      t.integer :itunes_genre_id

      t.timestamps
    end
  end
end
