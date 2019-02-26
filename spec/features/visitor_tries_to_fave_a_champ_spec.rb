require 'rails_helper'

describe 'Visitor visits /champ_name' do

  before(:each) do
    file = File.open('./db/champ_data.json').read
    champ = JSON.parse(file)[0]
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

  describe "they should see the champion show page" do

    it "with a favorite link" do
      visit '/'

      click_on("Annie, The Dark Child")

      expect(current_path).to eq(champion_path("annie"))

      expect(page).to have_link("Favorite")
    end

  end

  describe "when they click on it" do

    before(:each) do
      visit champion_path("annie")

      click_link("Favorite")
    end

    it "they should be redirected to the login page" do
      expect(current_path).to eq(login_path)
    end

    it "and they should see a flash message" do
      expect(page).to have_content("You need to login or register to favorite champions")
    end

  end

end
