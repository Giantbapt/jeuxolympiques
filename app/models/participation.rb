
class Participation < ActiveRecord::Base
  belongs_to :edition
  belongs_to :athlete
end
