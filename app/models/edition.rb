class Edition < ApplicationRecord
  has_many :participations

  has_many :athletes, through: :participations
end
