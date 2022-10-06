class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name,presence:true
  validates :introduction,presence:true

   has_one_attached :image


end
