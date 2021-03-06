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

ActiveRecord::Schema.define(:version => 20110918070119) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "job_title"
    t.string   "business_phone"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "fax_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "web_page"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "durations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length_rating"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "job_title"
    t.string   "business_phone"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "fax_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "web_page"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "escalation_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.string   "caller"
    t.integer  "assigned_to_id"
    t.string   "bound"
    t.integer  "company_id"
    t.integer  "opened_at_id"
    t.string   "store_number"
    t.integer  "reason_code_id"
    t.integer  "additional_reason_code_id"
    t.integer  "product_id"
    t.boolean  "escalated"
    t.integer  "escalated_to_id"
    t.integer  "duration_id"
    t.string   "order_rma"
    t.datetime "opened_at"
    t.string   "attachment"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs_logs", :id => false, :force => true do |t|
    t.integer "log_1_id"
    t.integer "log_2_id"
  end

  create_table "phone_logs", :id => false, :force => true do |t|
    t.datetime "opened_date"
    t.string   "caller"
    t.string   "assigned_to",            :limit => 511
    t.string   "in_out_bound"
    t.string   "company"
    t.string   "store_number"
    t.string   "reason_code"
    t.string   "additional_reason_code"
    t.string   "product_code"
    t.string   "escalated",              :limit => 3
    t.string   "escalated_to"
    t.string   "duration"
    t.string   "order_rma"
    t.text     "notes"
    t.string   "attachment_name"
    t.binary   "attachment_link",        :limit => 313
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "rails_admin_histories_index"

  create_table "reason_codes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.text     "sql"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
