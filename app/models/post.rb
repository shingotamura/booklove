class Post < ApplicationRecord
    belongs_to :user
     validates :content, presence: true, length: { maximum: 255 }
     validates :title, presence: true, length: { maximum: 255 }
     validates :author, presence: true, length: { maximum: 255 }
    mount_uploader :image, ImageUploader
    
    has_many :favorites,dependent: :destroy
    has_many :users, through: :favorites,source: :user
end
