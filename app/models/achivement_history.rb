class AchivementHistory < ApplicationRecord
    belongs_to :user
    enum achivement: [:BEGINNER, :ROOKIE, :CHALLENGER, :MASTER]
end
