class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.integer :price_amount, null: false
      t.string :price_currency, null: false
      t.text :summary
      t.string :copyrights
      t.string :artist
      t.string :image_url
      t.integer :itunes_medium_id

      t.timestamps
    end
  end
end
