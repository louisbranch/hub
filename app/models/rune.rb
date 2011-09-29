class Rune < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  has_many :rune_effects
  has_many :build_skills
  has_many :skills, :through => :rune_effects
end
