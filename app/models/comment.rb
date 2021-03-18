class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :text,   presence: true
end
