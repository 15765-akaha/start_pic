class AccivementHistory < ApplicationRecord
    belongs_to :user
    enum accivement: [:BEGINNER, :ROOKIE, :CHALLENGER, :MASTER]
end
