class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :details
      t.date :due_date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
