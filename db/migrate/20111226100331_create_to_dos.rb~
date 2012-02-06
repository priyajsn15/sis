class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.integer :user_id
      t.string :title
      t.text  :notes
      t.date :start
      t.date :end
      t.time :from_time
      t.time :to_time
      t.string  :assign_to
      t.boolean  :category_a
      t.boolean  :category_b
      t.boolean  :category_c
      t.boolean :status
      t.timestamps
    end
  end
end
