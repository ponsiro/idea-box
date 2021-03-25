class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :name, presence: true
  validates :profile, length: {maximum: 300}

  has_many :ideas
  has_one_attached :icon
  has_many :comments
  has_many :likes

  def liked_by?(idea_id)
    likes.where(idea_id: idea_id).exists?
  end
end
