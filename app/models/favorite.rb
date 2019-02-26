class Favorite < ApplicationRecord
  belongs_to :champion
  belongs_to :user
end
