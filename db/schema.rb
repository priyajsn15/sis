# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111231065650) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "notes"
    t.integer  "assign_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "category_a"
    t.boolean  "category_b"
    t.boolean  "category_c"
    t.date     "from_date"
    t.date     "to_date"
    t.time     "from_time"
    t.time     "to_time"
    t.boolean  "status"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "notes"
    t.integer  "assign_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "category_a"
    t.boolean  "category_b"
    t.boolean  "category_c"
    t.date     "from_date"
    t.date     "to_date"
    t.time     "from_time"
    t.time     "to_time"
    t.boolean  "status"
  end

  create_table "goals", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "notes"
    t.integer  "assign_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "category_a"
    t.boolean  "category_b"
    t.boolean  "category_c"
    t.date     "from_date"
    t.date     "to_date"
    t.time     "from_time"
    t.time     "to_time"
    t.boolean  "status"
  end

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "role_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "to_dos", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "notes"
    t.integer  "assign_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "category_a"
    t.boolean  "category_b"
    t.boolean  "category_c"
    t.date     "start"
    t.date     "end"
    t.time     "from_time"
    t.time     "to_time"
    t.boolean  "status"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode"
    t.integer  "phone_no"
    t.string   "provider_health"
    t.string   "medications"
    t.string   "allergies"
    t.string   "provider_mental"
    t.string   "treatment_history"
    t.string   "recovery_plan"
    t.boolean  "is_admin",                              :default => false
    t.integer  "depression_level"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
