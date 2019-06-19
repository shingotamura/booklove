class User < ApplicationRecord
    before_save { self.email.downcase! }
    
    
    
    validates :name,presence: true, length: { maximum: 50 }
    validates :kind,presence: true, length: { maximum: 50 }
    validates :email,presence: true, length: { maximum: 255 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                     uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :posts
    has_many :favorites
    has_many :likes, through: :favorites,source: :post
    
    def like(post)
        self.favorites.find_or_create_by(post_id: post.id)
    end
    
    def unlike(post)
        favorite=self.favorites.find_by(post_id: post.id)
        favorite.destroy if favorites
    end
    
    def like?(post)
       self.likes.include?(post)
    end
        
end
