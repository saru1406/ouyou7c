class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
   has_one_attached :image

  validates :name,presence:true
  validates :introduction,presence:true


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end


end
