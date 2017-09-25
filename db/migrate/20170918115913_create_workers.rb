class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.references :library, foreign_key: true
      t.string :sname
      t.string :fname
      t.date :birthday
      t.date :start_date
      t.string :post
      t.string :education

      t.timestamps
    end
  end
end
