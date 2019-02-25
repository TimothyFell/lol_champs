require 'rails_helper'

describe 'Visitor visits /' do

  before(:each) do
    file = File.open('./db/champ_data.json').read
    champions = JSON.parse(file)[0..4]
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

  describe "they should see a landing area" do

    it "with 'Welcome to LOL Champs'" do
      visit '/'

      expect(page).to have_content("Welcome to LOL Champs")
      expect(page).to have_button("Search")
    end
    it "with a search button" do
      visit '/'

      expect(page).to have_button("Search")
    end

  end

  describe "They should see a section" do

    it "with a list of all the champions" do
      visit '/'

      expect(page).to have_css(".champions")

      within(".champions") do
        expect(page).to have_css(".champ", count: 5)
      end

      within(first(".champ")) do
        expect(page).to have_link("Annie, The Dark Child")
      end
    end

  end

end
