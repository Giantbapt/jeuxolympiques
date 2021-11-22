class Edition < ActiveRecord::Base
  has_many :participations

  has_many :athletes, through: :participations
end
