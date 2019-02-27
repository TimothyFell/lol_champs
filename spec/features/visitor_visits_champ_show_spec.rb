require 'rails_helper'

describe 'Visitor visits /champ_name' do

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

    it "with the champions name and title" do
      visit '/'

      click_on("Annie, The Dark Child")

      expect(current_path).to eq(champion_path("annie"))
      within('.splash') do
        expect(page).to have_content('Annie, The Dark Child')
      end
    end

  end

  describe "And a section " do

    it "containg all of the champions stats" do
      visit champion_path('annie')

      within('.stats') do
        expect(page).to have_content("Attack")
        expect(page).to have_content("Defense")
        expect(page).to have_content("Magic")
        expect(page).to have_content("Difficulty")
        expect(page).to have_content("HP")
        expect(page).to have_content("+ HP/Level")
        expect(page).to have_content("MP")
        expect(page).to have_content("+ MP/Level")
        expect(page).to have_content("Move Speed")
        expect(page).to have_content("Armor")
        expect(page).to have_content("+ Armor/Level")
        expect(page).to have_content("Spell Block")
        expect(page).to have_content("+ Spell Block/Level")
        expect(page).to have_content("Attack Range")
        expect(page).to have_content("HP Regen")
        expect(page).to have_content("+ HP Regen/Level")
        expect(page).to have_content("MP Regen")
        expect(page).to have_content("+MP Regen/Level")
        expect(page).to have_content("Attack Damage")
        expect(page).to have_content("+ Attack Damage/Level")
        expect(page).to have_content("Attack Speed Offset")
      end

    end

  end

end
