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

ActiveRecord::Schema.define(:version => 20121129141438) do

  create_table "business_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "disabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "clients", ["created_at"], :name => "index_clients_on_created_at"
  add_index "clients", ["email"], :name => "index_clients_on_email"
  add_index "clients", ["parent_id"], :name => "index_clients_on_parent_id"
  add_index "clients", ["reseller"], :name => "index_clients_on_reseller"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "disabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "licenses", ["client_id"], :name => "index_licenses_on_client_id"
  add_index "licenses", ["created_at"], :name => "index_licenses_on_created_at"
  add_index "licenses", ["expired"], :name => "index_licenses_on_expired"
  add_index "licenses", ["key"], :name => "index_licenses_on_key"
  add_index "licenses", ["trial"], :name => "index_licenses_on_trial"

  create_table "payment_gateways", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.boolean  "disabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "license_id"
    t.datetime "date"
    t.integer  "period"
    t.integer  "price"
    t.integer  "paid"
    t.integer  "payment_gateway_id"
    t.text     "notes"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
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
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "archived"
    t.boolean  "authentic",  :default => false
    t.string   "uuid"
  end

  add_index "servers", ["archived"], :name => "index_servers_on_archived"
  add_index "servers", ["authentic"], :name => "index_servers_on_authentic"
  add_index "servers", ["client_id"], :name => "index_servers_on_client_id"
  add_index "servers", ["license_id"], :name => "index_servers_on_license_id"
  add_index "servers", ["trial"], :name => "index_servers_on_trial"
  add_index "servers", ["updated_at"], :name => "index_servers_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
