class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.references :book, foreign_key: true
      t.references :subscriber, foreign_key: true
      t.date :d_start
      t.date :d_end

      t.timestamps
    end
  end
end
