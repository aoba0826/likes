class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  def favorited?(user)
    self.favorites.exists?(user_id: user.id)
  end
end
