class Theme < ApplicationRecord
	validates :title, presence: true
	has_many :post_images
end
