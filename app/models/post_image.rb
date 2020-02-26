class PostImage < ApplicationRecord
  # validates :image_id, presence: true
  attachment :image
  belongs_to :user
  belongs_to :theme
  has_many :image_comments, dependent: :destroy
  has_many :likes,			dependent: :destroy
end
