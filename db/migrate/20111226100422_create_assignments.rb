class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.string :title
      t.text  :notes
      t.date :from_date
      t.date :to_date
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
