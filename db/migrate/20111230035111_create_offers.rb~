class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.string :banner_file_name
      t.string :banner_content_type
      t.integer :banner_file_size
      t.datetime :banner_updated_at
      t.timestamps
    end
  end
end
