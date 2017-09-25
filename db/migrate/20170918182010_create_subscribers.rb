class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.references :library, foreign_key: true
      t.integer :number
      t.string :fname
      t.string :sname
      t.string :mname
      t.text :address
      t.integer :phone

      t.timestamps
    end
  end
end
