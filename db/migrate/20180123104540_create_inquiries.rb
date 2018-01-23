class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :inquirer
      t.string :email
      t.text :body
      t.timestamps
    end
  end
end
