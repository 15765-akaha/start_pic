class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length:{ minimum:2, maximum: 20}
  validates	:introduction, length: { maximum: 150 }
  # refaile
  attachment :profile_image
  # 称号設定 0=beginner
  enum accivement: [:BEGINNER, :ROOKIE, :CHALLENGER, :MASTER]
  # リレーション
  has_many :post_images, dependent: :destroy
  has_many :likes,		 dependent: :destroy
  # ユーザーがお気に入りした投稿画像を集める
  has_many :likes_post_images, through: :likes, source: :post_image
  has_many :image_comments, dependent: :destroy
  # フォローする側のユーザー視点
  has_many :active_relationships, class_name:"Relationship", foreign_key:"following_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  # フォローされる側のユーザー視点
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user) #フォロー側から見てフォローを既にしているかどうか。
    if user
      passive_relationships.find_by(following_id: user.id).present?
    end
  end

end
