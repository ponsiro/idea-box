class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :ideas
  has_many :comments
  has_many :likes

  def liked_by?(idea_id)
    likes.where(idea_id: idea_id).exists?
  end
end
