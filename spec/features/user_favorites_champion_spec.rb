require 'rails_helper'

describe 'User Favorites a Champion' do

  before(:each) do
    file = File.open('./db/champ_data.json').read
    champ = JSON.parse(file)[0]
    @champion = Champion.create({
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
    @user = User.create(name: "Bob", email: 'bob@bob.com', password: '0987654321', password_confirmation: '0987654321')
    visit '/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on('Log in')
  end

  it "They are taken to their favorites page" do
    visit "/champions/#{@champion.name}"

    expect(page).to have_content("#{@champion.name.titleize}")

    click_on("Favorite")

    expect(current_path).to eq(my_favorites_path)
  end

  describe "Sad Paths" do
    it "They try to favorite a champion they already did" do
      visit "/champions/#{@champion.name}"

      click_on("Favorite")

      visit "/champions/#{@champion.name}"

      click_on("Favorite")

      expect(current_path).to eq(my_favorites_path)
      expect(page).to have_content("You've already favorited that champion, silly!")
      expect(page).to have_css('.champ', count:1)
    end
  end

end
