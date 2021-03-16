class Idea < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :idea_tags
  has_many :tags, through: :idea_tags
  
end
