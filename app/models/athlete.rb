class Athlete < ActiveRecord::Base
  has_many :participations

  has_many :editions, through: :participations
end
