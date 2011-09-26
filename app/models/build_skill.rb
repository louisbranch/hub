class BuildSkill < ActiveRecord::Base
  belongs_to :build
  belongs_to :skill
  belongs_to :rune
  has_many :rune_effects, :through => :runes
  
  #validates :build_id,  :presence => true
  #validates :skill_id,  :presence => true
end
