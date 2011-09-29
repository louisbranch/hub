class BuildSkill < ActiveRecord::Base
  
  belongs_to :build
  belongs_to :skill
  belongs_to :rune
  has_many :rune_effects, :through => :runes

  def effect
    RuneEffect.where("skill_id = ? AND rune_id = ?", self.skill_id, self.rune_id).first
  end
  
end

