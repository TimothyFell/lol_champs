class Champion < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  def favorite?(user)
    if user
      user.favorites.find_by(champion_id: self.id).nil?
    else
      return true
    end
  end
end
