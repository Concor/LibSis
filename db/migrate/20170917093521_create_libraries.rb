class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :number
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
