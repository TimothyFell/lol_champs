class ChampionFacade

  def initialize(params= nil)
    @params = params
    @stat_names = {
      "attack": "Attack",
      "defense": "Defense",
      "magic": "Magic",
      "difficulty": "Difficulty",
      "hp": "Hit Points",
      "hpUpPerLevel": "+ HP/Level",
      "mp": "Mana Points",
      "mpUpPerLevel": "+ MP/Level",
      "moveSpeed": "Move Speed",
      "armor": "Armor",
      "armorPerLevel": "+ Armor/Level",
      "spellBlock": "Spell Block",
      "spellBlockPerLevel": "+ Spell Block/Level",
      "attackRange": "Attack Range",
      "hpRegen": "HP Regen",
      "hpRegenPerLevel": "+ HP Regen/Level",
      "mpRegen": "MP Regen",
      "mpRegenPerLevel": "+MP Regen/Level",
      "attackDamage": "Attack Damage",
      "attackDamagePerLevel": "+ Attack Damage/Level",
      "attackSpeedOffset": "Attack Speed Offset"
    }
  end

  def champs
    if @params["champion"]
      Champion.where(["name LIKE ?", "%#{@params["champion"].downcase}%"]).order(:name)
    else
      Champion.all.order(:name)
    end
  end

  def favorites(user)
    favorites = Favorite.where(user_id: user.id)
    fav_champs = favorites.map do |fave|
      Champion.find(fave.champion_id)
    end
  end

  def current_champ
    Champion.find_by(name: @params["name"])
  end

  def current_champ_stats
    champ_stats = Champion.find_by(name: @params["name"]).attributes
    champ_stats.delete("name")
    champ_stats.delete("title")
    champ_stats.delete("id")
    champ_stats.delete("championId")
    champ_stats.delete("created_at")
    champ_stats.delete("updated_at")
    show_stats = {}
    champ_stats.each do |key, val|
      show_stats[@stat_names[key.to_sym]] = val
    end
    return show_stats
  end

end
