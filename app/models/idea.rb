class Idea < ApplicationRecord
  validates :content, presence: true, unless: :was_attached?
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :idea_tags
  has_many :tags, through: :idea_tags
  

  def self.search(search)
    if search != ""
      Idea.where('content LIKE(?)', "%#{search}%")
    else
      Idea.all
    end
  end

  def was_attached?
    self.image.attached?
  end
end
