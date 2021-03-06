class Theme < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :create_user_id, presence: true, if: :created_user?
	has_many :post_images

	def created_user?
		self.admin == false
	end

	def self.search(search) #テーマタイトルの検索
	 if search # 非公開のテーマは除く
		Theme.where(is_enabled: true).where(['title LIKE ?', "%#{search}%"])
	 else
		Theme.where(is_enabled: true)
	 end
	end
end