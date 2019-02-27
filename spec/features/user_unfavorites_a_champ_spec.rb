require 'rails_helper'

describe 'User Favorites a Champion' do

  before(:each) do
    file = File.open('./db/champ_data.json').read
    champs = JSON.parse(file)[0..5]
    @champions = champs.map do |champ|
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
    @user = User.create(name: "Bob", email: 'bob@bob.com', password: '0987654321', password_confirmation: '0987654321')
    visit '/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on('Log in')
    visit "/champions/#{@champions[0].name}"
    click_on("Favorite")
    visit "/champions/#{@champions[1].name}"
    click_on("Favorite")
    visit "/champions/#{@champions[0].name}"
    click_on("Unfavorite")
  end

  describe 'When they click on Unfavorite then' do

    it "they should end up on their favorites page" do
      expect(current_path).to eq(my_favorites_path)
    end

    it "they should not see the champ in their favorites" do
      gone = "#{@champions[0].name}, #{@champions[0].title}"
      expect(page).to_not have_content(gone)
    end

    it "they should get a flash message telling them which champ they unfavorited" do
      within '.flash' do
        message = "You've successfuly unfavorited #{@champions[0].name.titleize}"
        expect(page).to have_content(message)
      end
    end

  end

end
