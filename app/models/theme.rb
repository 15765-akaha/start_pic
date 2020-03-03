class Theme < ApplicationRecord
	validates :title, presence: true
	has_many :post_images

	def self.search(search) #テーマタイトルの検索
	 if search
		Theme.where(['title LIKE ?', "%#{search}%"])
	 else
		Theme.all
	 end
	end
end
