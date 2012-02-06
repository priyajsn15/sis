class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.text :address
      t.string :city
      t.string :state
      t.integer :pincode
      t.integer :phone_no
      t.string :provider_health
      t.string :medications
      t.string :allergies
      t.string :provider_mental
      t.string :treatment_history
      t.string :recovery_plan
      t.boolean :is_admin
      t.string :depression_level
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end
end
