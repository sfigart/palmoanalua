# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131223041307) do

  create_table "registrations", :force => true do |t|
    t.string   "activity"
    t.string   "player_first_name"
    t.string   "player_last_name"
    t.string   "father_first_name"
    t.string   "father_last_name"
    t.string   "mother_first_name"
    t.string   "mother_last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state",                     :limit => 2
    t.string   "zip_code",                  :limit => 5
    t.string   "home_phone",                :limit => 50
    t.string   "father_work_phone",         :limit => 50
    t.string   "father_cell_phone",         :limit => 50
    t.string   "mother_work_phone",         :limit => 50
    t.string   "mother_cell_phone",         :limit => 50
    t.string   "email_address",             :limit => 100
    t.string   "school"
    t.string   "grade",                     :limit => 1
    t.date     "birth_date"
    t.string   "encrypted_birth_date"
    t.integer  "age"
    t.string   "gender",                    :limit => 1
    t.string   "shirt_size"
    t.boolean  "has_medical_insurance"
    t.string   "medical_insurance_name"
    t.string   "practice_days"
    t.string   "volunteer_type"
    t.string   "parent_name_for_agreement"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "lives_in_district"
    t.boolean  "has_geographic_exception"
    t.string   "division"
    t.string   "remote_ip"
    t.string   "method"
    t.text     "user_agent"
    t.text     "params"
    t.string   "http_referrer"
    t.text     "http_cookie"
    t.string   "request_fullpath"
    t.boolean  "has_played"
    t.integer  "years_played"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
