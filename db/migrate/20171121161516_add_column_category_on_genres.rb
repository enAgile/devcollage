class AddColumnCategoryOnGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :category, :string
  end
end
