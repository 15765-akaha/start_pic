class PostImage < ApplicationRecord
  # validates :image_id, presence: true
  attachment :image
  acts_as_taggable
  belongs_to :user
  belongs_to :theme
  has_many :image_comments, dependent: :destroy
  has_many :likes,			dependent: :destroy

  # 既に引数のユーザーがいいねをクリエイトしているか
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # def self.search(search) #タグのキーワード検索
  #   if search
  #    PostImage.where(['tags LIKE ?', "%#{search}%"])
  #   else
  #    PostImage.all
  #   end
  #  end
end
