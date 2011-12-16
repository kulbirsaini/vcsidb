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

ActiveRecord::Schema.define(:version => 20111216082313) do

  create_table "business_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.integer  "business_type_id"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.string   "other_emails"
    t.integer  "payment_gateway_id"
    t.boolean  "expired"
    t.boolean  "reseller"
    t.integer  "parent_id"
    t.text     "notes"
    t.boolean  "flag"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", :force => true do |t|
    t.integer  "client_id"
    t.string   "key"
    t.datetime "start_date"
    t.datetime "renewal_date"
    t.boolean  "trial"
    t.boolean  "expired"
    t.integer  "num_servers"
    t.text     "notes"
    t.integer  "renewal_reminders"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_gateways", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "license_id"
    t.datetime "date"
    t.integer  "period"
    t.integer  "price"
    t.integer  "paid"
    t.integer  "payment_gateway_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.string   "email"
    t.integer  "license_id"
    t.integer  "client_id"
    t.string   "version"
    t.string   "revision"
    t.boolean  "trial"
    t.text     "macs"
    t.text     "ips"
    t.string   "python"
    t.string   "squid"
    t.string   "os_name"
    t.string   "os_id"
    t.string   "os_version"
    t.string   "system"
    t.string   "arch"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archived"
    t.boolean  "authentic",  :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
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
