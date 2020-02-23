class Relationship < ApplicationRecord
	belongs_to :following, class_name:"User" #フォローする人
	belongs_to :follower,  class_name:"User" #フォローされる人
end
