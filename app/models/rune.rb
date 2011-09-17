class Rune < ActiveRecord::Base
  has_many :rune_effects
  has_many :skills, :through => :rune_effects
end
