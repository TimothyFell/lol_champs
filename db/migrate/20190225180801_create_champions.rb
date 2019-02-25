class CreateChampions < ActiveRecord::Migration[5.2]
  def change
    create_table :champions do |t|
      t.decimal :attack
      t.decimal :defense
      t.decimal :magic
      t.decimal :difficulty
      t.decimal :hp
      t.decimal :hpUpPerLevel
      t.decimal :mp
      t.decimal :mpUpPerLevel
      t.decimal :moveSpeed
      t.decimal :armor
      t.decimal :armorPerLevel
      t.decimal :spellBlock
      t.decimal :spellBlockPerLevel
      t.decimal :attackRange
      t.decimal :hpRegen
      t.decimal :hpRegenPerLevel
      t.decimal :mpRegen
      t.decimal :mpRegenPerLevel
      t.decimal :attackDamage
      t.decimal :attackDamagePerLevel
      t.decimal :attackSpeedOffset
      t.integer:championId
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
