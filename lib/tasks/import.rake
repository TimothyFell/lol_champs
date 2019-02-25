require 'net/https'
require 'uri'
require 'json'

namespace :import do
  desc "Import Data from JSON file"

  task json: :environment do
    file = File.open('./db/champ_data.json').read
    champions = JSON.parse(file)
    champions.each do |champ|
      Champion.create({
        attack: champ["Attack"],
        defense: champ["Defense"],
        magic: champ["Magic"],
        difficulty: champ["Difficulty"],
        hp: champ["Hp"],
        hpUpPerLevel: champ["HpUpPerLevel"],
        mp: champ["Mp"],
        mpUpPerLevel: champ["MpUpPerLevel"],
        moveSpeed: champ["MoveSpeed"],
        armor: champ["Armor"],
        armorPerLevel: champ["ArmorPerLevel"],
        spellBlock: champ["SpellBlock"],
        spellBlockPerLevel: champ["SpellBlockPerLevel"],
        attackRange: champ["AttackRange"],
        hpRegen: champ["HpRegen"],
        hpRegenPerLevel: champ["HpRegenPerLevel"],
        mpRegen: champ["MpRegen"],
        mpRegenPerLevel: champ["MpRegenPerLevel"],
        attackDamage: champ["AttackDamage"],
        attackDamagePerLevel: champ["AttackDamagePerLevel"],
        attackSpeedOffset: champ["AttackSpeedOffset"],
        championId: champ["ChampionId"],
        name: champ["Name"].downcase,
        title: champ["Title"].downcase
      })
    end
  end
end
