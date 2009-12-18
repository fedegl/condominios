# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091218162947) do

  create_table "companies", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.string  "price"
    t.string  "phone"
    t.string  "city"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "user_id"
  end

  create_table "companies_complex_types", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "complex_type_id"
  end

  create_table "complex_types", :force => true do |t|
    t.string "name"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
    t.string "short"
  end

  create_table "experiences", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.string  "start_year"
    t.string  "end_year"
    t.integer "company_id"
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.integer "country_id"
    t.string  "short"
    t.string  "abbr"
    t.string  "short2"
  end

  create_table "tools", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "company_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

end
