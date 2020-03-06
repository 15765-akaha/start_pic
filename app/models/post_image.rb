class PostImage < ApplicationRecord
  # validates :image_id, presence: true
  attachment :image
  acts_as_taggable
  belongs_to :user
  belongs_to :theme
  has_many :image_comments, dependent: :destroy
  has_many :likes,			dependent: :destroy

  # 既に引数のユーザーがいいねをクリエイトしているか、引数がない場合はスルー
  def liked_by?(user)
    if user
      likes.where(user_id: user.id).exists?
    end
  end
end
