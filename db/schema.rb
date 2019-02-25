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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_25_180801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.decimal "attack"
    t.decimal "defense"
    t.decimal "magic"
    t.decimal "difficulty"
    t.decimal "hp"
    t.decimal "hpUpPerLevel"
    t.decimal "mp"
    t.decimal "mpUpPerLevel"
    t.decimal "moveSpeed"
    t.decimal "armor"
    t.decimal "armorPerLevel"
    t.decimal "spellBlock"
    t.decimal "spellBlockPerLevel"
    t.decimal "attackRange"
    t.decimal "hpRegen"
    t.decimal "hpRegenPerLevel"
    t.decimal "mpRegen"
    t.decimal "mpRegenPerLevel"
    t.decimal "attackDamage"
    t.decimal "attackDamagePerLevel"
    t.decimal "attackSpeedOffset"
    t.integer "championId"
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
