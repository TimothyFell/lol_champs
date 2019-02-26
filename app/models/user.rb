class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation:true, on: :create
  validates :password, confirmation:true, allow_blank: true, on: :update

  has_many :favorites
  has_many :champions, through: :favorites

  has_secure_password

end
