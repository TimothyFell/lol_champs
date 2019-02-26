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
  end

  it "They are taken to their favorites page" do
    visit "/champions/#{@champions[0].name}"

    expect(page).to have_content("#{@champions[0].name.titleize}")

    click_on("Favorite")

    expect(current_path).to eq(my_favorites_path)
  end

  it "they favorite more than one" do
    visit "/champions/#{@champions[0].name}"
    click_on("Favorite")
    visit "/champions/#{@champions[1].name}"
    click_on("Favorite")

    expect(current_path).to eq(my_favorites_path)
    expect(page).to have_css('.champ', count:2)
  end

  it "the stats for a champion are displayed on their favorites page" do
    visit "/champions/#{@champions[0].name}"
    click_on("Favorite")

    within('.champ') do
      expect(page).to have_content("Attack:")
      expect(page).to have_content(@champions[0].attack)
      expect(page).to have_content("Defense:")
      expect(page).to have_content(@champions[0].defense)
      expect(page).to have_content("Magic:")
      expect(page).to have_content(@champions[0].magic)
      expect(page).to have_content("Difficulty:")
      expect(page).to have_content(@champions[0].difficulty)
      expect(page).to have_content("Attack Damage:")
      expect(page).to have_content(@champions[0].attackDamage)
      expect(page).to have_content("Health Points:")
      expect(page).to have_content(@champions[0].hp)
      expect(page).to have_content("Mana Points:")
      expect(page).to have_content(@champions[0].mp)
      expect(page).to have_content("Armor:")
      expect(page).to have_content(@champions[0].armor)
      expect(page).to have_content("Spell Block:")
      expect(page).to have_content(@champions[0].spellBlock)
      expect(page).to have_content("Move Speed:")
      expect(page).to have_content(@champions[0].moveSpeed)
    end
  end

  describe "Sad Paths" do
    it "They try to favorite a champion they already did" do
      visit "/champions/#{@champions[0].name}"

      click_on("Favorite")

      visit "/champions/#{@champions[0].name}"

      click_on("Favorite")

      expect(current_path).to eq(my_favorites_path)
      expect(page).to have_content("You've already favorited that champion, silly!")
      expect(page).to have_css('.champ', count:1)
    end
  end

end
