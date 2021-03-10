class Idea < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :idea_tags
  has_many :tags, through: :ideat_tags
end
