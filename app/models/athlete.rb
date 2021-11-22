class Athlete < ApplicationRecord
  has_many :participations

  has_many :editions, through: :participations
end
