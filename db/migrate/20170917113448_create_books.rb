class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :library, foreign_key: true
      t.text :name
      t.text :author
      t.string :cipher
      t.string :publ
      t.integer :publ_y
      t.float :price
      t.date :date

      t.timestamps
    end
  end
end
